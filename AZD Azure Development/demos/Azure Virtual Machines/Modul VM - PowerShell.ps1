####### Falls VMs nicht erzeugt werden können wg. CustomizationErrors
Install-Module -Name Az.Compute -RequiredVersion 4.25
########

#Connect to ARM
Connect-AzAccount

Get-AzSubscription -SubscriptionId "41896939-6760-4fbc-aa50-c5dde7e96f05" | Set-AzContext


#VM get list of images
Get-AzVMImagePublisher -Location $loc.DisplayName | ? {$_.PublisherName -like "microsoft*"}
Get-AzVMImageOffer -Location "west europe" -PublisherName "MicrosoftWindowsServer"
Get-AzVMImageSku -Location "west europe" -PublisherName "MicrosoftWindowsServer" -Offer "WindowsServer"
#VM get list of VM sizes
Get-AzVMSize -Location "westeurope"

#Deployment einzelner VMs
$rg = New-AzResourceGroup -Name AzureTrainingModuleVM -Location westeurope

 # Deploy Windows Server
$vm = New-AzVm `
    -ResourceGroupName $rg.ResourceGroupName `
    -Name "trainingVmWin" `
    -Location "westeurope" `
    -VirtualNetworkName "myVnet" `
    -SubnetName "mySubnet" `
    -SecurityGroupName "trainingNetworkSecurityGroup" `
    -PublicIpAddressName "trainingPublicIpAddress" `
    -ImageName Win2019Datacenter
    #-OpenPorts 80,3389


# GEt IP
$ip = Get-AzPublicIpAddress -ResourceGroupName $rg.ResourceGroupName | Select "IpAddress"
$ip

# Install IIS
$res = Set-AzVMExtension -ResourceGroupName $rg.ResourceGroupName `
    -ExtensionName "IIS" `
    -VMName $vm.Name `
    -Location $vm.Location `
    -Publisher Microsoft.Compute `
    -ExtensionType CustomScriptExtension `
    -TypeHandlerVersion 1.8 `
    -SettingString '{"commandToExecute":
    "powershell Add-WindowsFeature Web-Server; 
    powershell Add-Content -Path \"C:\\inetpub\\wwwroot\\Default.htm\" -Value $($env:computername)"}'

#Commandos direkt auf VM ausführen - WINDOWS
Invoke-AzVMRunCommand -ResourceGroupName '<myResourceGroup>' -Name '<myVMName>' -CommandId 'RunPowerShellScript' -ScriptPath '<pathToScript>' -Parameter @{"arg1" = "var1";"arg2" = "var2"}
#Für Linux
Set-AzVMRunCommand -ResourceGroupName "myRG" -VMName "myVM" -Name "RunCommandName" – Script "echo Hello World!"

#Get VM State
Get-AzVM -Name trainingVmWin  -Status

## Availability Sets
$as = New-AzAvailabilitySet -ResourceGroupName $rg.ResourceGroupName -Name AS_Training -Location "west europe"
Get-AzAvailabilitySet -Name $as.Name -ResourceGroupName $rg.ResourceGroupName

#Add 2 VMs to avaiability set
$cred = Get-Credential

for ($i=1; $i -le 2; $i++)
{
    New-AzVm `
        -ResourceGroupName $rg.ResourceGroupName`
        -Name "trainingHighAvailableVM$i" `
        -Location $as.Location `
        -VirtualNetworkName "myhaVnet" `
        -SubnetName "mySubnet" `
        -SecurityGroupName "myNetworkSecurityGroup" `
        -PublicIpAddressName "myPublicIpAddress$i" `
        -AvailabilitySetName $as.Name `
        -Credential $cred
}

Remove-AzAvailabilitySet -Name $as.Name  -ResourceGroupName $rg.ResourceGroupName

## Scale Sets
$vmssConfig= New-AzVmss `
  -ResourceGroupName $rg.ResourceGroupName `
  -Location "west europe" `
  -VMScaleSetName "myScaleSetPS" `
  -VirtualNetworkName "myScakedVnet" `
  -SubnetName "mySCaledSubnet" `
  -PublicIpAddressName "trainingScaledIP" `
  -LoadBalancerName "trainingLoadBalancer" `
  -UpgradePolicyMode "Automatic"

#Add VM to scale set

$scalevm = New-AzVm `
    -ResourceGroupName $rg.ResourceGroupName `
    -Name "scaledtrainingVmWin" `
    -Location "westeurope" `
    -VmssId $vmssConfig.Id

#Clean Up
Remove-AzVmss -VMScaleSetName $vmssConfig.FullyQualifiedDomainName -ResourceGroupName $rg.ResourceGroupName
Remove-AzResourceGroup -Name $rg.ResourceGroupName

########
##Load balancing
##########

$loadbalancerrg = New-AzResourceGroup -ResourceGroupName "myResourceGroupLoadBalancer" -Location "west europe"
#Public IP
$loadBalancerIP = New-AzPublicIpAddress ` -ResourceGroupName $loadbalancerrg.ResourceGroupName -Location $loadbalancerrg.Location `
  -AllocationMethod "Static" `
  -Name "myPublicIP"

# LB frontend IP pool
$frontendIP = New-AzLoadBalancerFrontendIpConfig -Name "myFrontEndPool" -PublicIpAddress $loadBalancerIP

#LB backeend IP pool for VMs
$backendPool = New-AzLoadBalancerBackendAddressPoolConfig -Name "myBackEndPool"

#create load balancer
$lb = New-AzLoadBalancer -ResourceGroupName $loadbalancerrg.ResourceGroupName -Name "myLoadBalancer" `
  -Location $loadbalancerrg.Location `
  -FrontendIpConfiguration $frontendIP `
  -BackendAddressPool $backendPool

# Create subnet config
$subnetConfig = New-AzVirtualNetworkSubnetConfig `
  -Name "mySubnet" `
  -AddressPrefix 192.168.1.0/24

# Create the virtual network
$vnet = New-AzVirtualNetwork `
  -ResourceGroupName $loadbalancerrg.ResourceGroupName `
  -Location $loadbalancerrg.Location `
  -Name "mylbVnet" `
  -AddressPrefix 192.168.0.0/16 `
  -Subnet $subnetConfig

#Create NICs and connect to load balancer backend
  for ($i=1; $i -le 3; $i++)
{
   New-AzNetworkInterface `
     -ResourceGroupName $loadbalancerrg.ResourceGroupName `
     -Name myVM$i `
     -Location $loadbalancerrg.Location `
     -Subnet $vnet.Subnets[0] `
     -LoadBalancerBackendAddressPool $lb.BackendAddressPools[0]
}

#Create AS for Vms in Load balacer
$availabilitySet = New-AzAvailabilitySet `
  -ResourceGroupName $loadbalancerrg.ResourceGroupName `
  -Name "mylbAvailabilitySet" `
  -Location $loadbalancerrg.Location `
  -Sku aligned `
  -PlatformFaultDomainCount 2 `
  -PlatformUpdateDomainCount 2

#Create VMs
for ($i=1; $i -le 3; $i++)
{
    New-AzVm -AvailabilitySetName $availabilitySet.Name -SubnetName $subnetConfig.Name  `
        -ResourceGroupName $loadbalancerrg.ResourceGroupName `
        -Name "myVM$i" `
        -Location $loadbalancerrg.Location `
        -VirtualNetworkName "mylbVnet" ` 
        -SecurityGroupName "myNetworkSecurityGroup" `
        -OpenPorts 80 `
        -Credential $cred `
        -AsJob 
        
}

##Test load balancer
# Install IIS and custom html page to test the VM reachability
for ($i=1; $i -le 3; $i++)
{
   Set-AzVMExtension `
     -ResourceGroupName $loadbalancerrg.ResourceGroupName `
     -ExtensionName "IIS" `
     -VMName myVM$i `
     -Publisher Microsoft.Compute `
     -ExtensionType CustomScriptExtension `
     -TypeHandlerVersion 1.8 `
     -SettingString '{"commandToExecute":"powershell Add-WindowsFeature Web-Server; powershell Add-Content -Path \"C:\\inetpub\\wwwroot\\Default.htm\" -Value $($env:computername)"}' `
     -Location $loadbalancerrg.Location
}
#get load balancer IP
$loadBalancerIP.IpAddress

#clean up
Remove-AzResourceGroup -InformationAction $loadbalancerrg.ResourceGroupName