##################################
#### Migrate AzureRM to AZ
#################################

#Get Azure RM versions
Get-Module -Name AzureRM -ListAvailable -All

# Option 1 - Aliasing
Install-Module -Name Az -AllowClobber -Scope CurrentUser
Uninstall-AzureRm
Enable-AzureRmAlias -Scope CurrentUser

# Option 2 - Update script
Install-Module -Name Az.Tools.Migration
# Generate an upgrade plan for all the scripts and module files in the specified folder and save it to a variable.
New-AzUpgradeModulePlan -FromAzureRmVersion 6.13.1 -ToAzVersion 6.1.0 -DirectoryPath "C:\Users\aasch\OneDrive\Training\Azure Development\Demos\Modul - Powershell und CLI.ps1" -OutVariable Plan

## Remove Azure RM from session to work with AZ
Remove-Module AzureRM
Uninstall-Module AzureRM
Import-Module AZ


###########################
## OLD #Working with ARM
###########################

#######AzureRM

#Installation
$PSVersionTable
Find-Module -Name AzureRM | Install-Module -Scope CurrentUser #Finden auf powershellgallery.com UND installieren
Import-Module AzureRM
#ODER Einzeln
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

install-module AzureRM -Scope CurrentUser #Azure RM
install-module Azure # ALT (Azure Service Manager)!!
#Connect
Connect-AzAccount
$sub = Get-AzureRmSubscription -SubscriptionName "MSDN Platforms Subscription" |  Set-AzureRmContext
Get-AzureRmContext | Select-Object -Property Tenant

# Manage
Get-AzureRmResourceGroup | Format-Table -Property ResourceGroupName
Get-AzureRmResourceGroup | ft | Export-Csv -Path "AZResourcegroups.csv"

#Update resources
Get-AzureRmLocation | Format-Table -Property DisplayName
New-AzureRmResourceGroup -Name "AzureTrainingRKU03" -Location "West Europe"
$rg = New-AzureRmResourceGroup -Name "AzureTraining" -Location "North Europe"

Get-AzureRmStorageAccount

#Deploy UBUNTU LTS VM
$cred = Get-Credential -UserName $env:USERNAME
New-AzureRmVm -ResourceGroupName "AzureTrainingRKU03" -Name "testvm-eus-01" -Credential (Get-Credential) -Location "west europe" -Image UbuntuLTS -OpenPorts 22
Get-AzureRmVM | ? {$_.Name -eq "testvm-eus-01"} | Stop-AzureRmVM

Set-ExecutionPolicy -ExecutionPolicy Unrestricted
install-module AzureRM -Scope CurrentUser
######
#Connect
Connect-AzureRmAccount
Get-AzureRmSubscription -SubscriptionName "Visual Studio Enterprise with MSDN" | Set-AzureRmContext
#Variante 2 zum Setzen der Subscription
Select-AzureRmSubscription -Subscription b2f447ae-f7a2-4e5c-bb54-3b1ddf2b6068
#Neue Resourcengruppe (zuerst location finden)
Get-AzureRmLocation | ? {$_.DisplayName -like "*europe*"}
new-AzureRmResourceGroup -Name "AzureTraining03" -Location "westeurope"
Get-AzureRmResourceGroup -Name AzureTraining03

#Deploy our custom ARM template
New-AzureRmResourceGroup -Name AzureTrainingMod01 -Location "West Europe"

New-AzureRmResourceGroupDeployment -Name DeploymentWithCode -ResourceGroupName AzureTrainingRKU03 `
-TemplateFile .\

Get-AzureRmLocation | ? {$_.DisplayName -like "*europe*"}

new-azurermvm -Image UbuntuLTS -ResourceGroupName AzureTraining03 -OpenPorts 22

$vm = Get-AzureRmVM -Name TrainingVM
$vm.StatusCode

Get-AzureRmVMImagePublisher -Location "west europe" | ? {$_.PublisherName -like "micro*"}
Get-AzureRmVMImageSku -Location "west europe" -PublisherName "MicrosoftSharePoint"

###################
##### AZ Module
###################

$resourceGroupName ="syscoverymod041"

# Install
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -AllowClobber -Force
# Connect
Connect-AzAccount 
# Connect with credential object (nicht best practice wg Passwort!)
$user = "aaschauer@outlook.com"
$pass = ConvertTo-SecureString -String "P@sSwOrd" -AsPlainText -Force
$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $user, $pass
Connect-AzAccount -Credential $credential

# If using MFA - add tenant ID
#Connect-AzAccount -TenantId 48e447d9-41e0-4a58-bdb0-29f8c08bdb15

Get-AzSubscription -SubscriptionId 41896939-6760-4fbc-aa50-c5dde7e96f05 | Set-AzContext
#Manage
Get-AzResourceGroup
Get-AzStorageAccount
#Create
#Get locations
$loc = Get-AzLocation | ? {$_.Location -like "westeurope*"}
$loc.DisplayName
$rg = New-AzResourceGroup -Name $resourceGroupName -Location $loc.DisplayName

########################
# Working with containers
# NB: if westeurope fails use northeurope (for some reason?)
#########################

$containerName = "syscnanoserver01";
$containerGroupName = "syscnanoservercg"

$containerNameIIS = "syscnanoserver02";
$containerGroupNameIIS = "syscnanoservercg2"

#Linux NGINX nano server
$port1 = New-AzContainerInstancePortObject -Port 8000 -Protocol TCP
#Create the container obkject locally
$container = New-AzContainerInstanceObject -Name $containerName -Image nginx -Port $port1
#Create the conatainer in Azure
New-AzContainerGroup -ResourceGroupName $resourceGroupName -Name $containerGroupName -container $container -OsType Linux -Location westeurope -IPAddressType 'Public'
Get-AzResourceProvider -ProviderNamespace 'Microsoft.ContainerInstance' -Location $loc.DisplayName
Register-AzResourceProvider -ProviderNamespace Microsoft.ContainerInstances

#Windows IIS nano server
$containerIIS = New-AzContainerInstanceObject -Name $containerNameIIS -Image mcr.microsoft.com/azuredocs/aci-helloworld
New-AzContainerGroup -ResourceGroupName $resourceGroupName -Name $containerGroupNameIIS -container $containerIIS -OsType 'Linux' -Location northeurope


#Check state
Get-AzContainerGroup -ResourceGroupName $resourceGroupName -Name $containerGroupName
Get-AzContainerInstanceLog -ContainerName $containerName -ContainerGroupName $containerGroupName -ResourceGroupName $resourceGroupName

#Clean up
Remove-AzContainerGroup -ResourceGroupName $resourceGroupName -Name $containerGroupName
#####################################################
###Container Backup SAmple (if westeurope fails)
###################################################
New-AzResourceGroup -Name test-rg -Location northeurope
$port1 = New-AzContainerInstancePortObject -Port 8000 -Protocol TCP
$port2 = New-AzContainerInstancePortObject -Port 8001 -Protocol TCP
$container = New-AzContainerInstanceObject -Name test-container -Image nginx -RequestCpu 1 -RequestMemoryInGb 1.5 -Port @($port1, $port2)
$containerGroup = New-AzContainerGroup -ResourceGroupName test-rg -Name test-cg -Location northeurope -Container $container -OsType Linux -RestartPolicy "Never" -IpAddressType Public



#######################
# Working with VMs
#######################
#VM get list of images
Get-AzVMImagePublisher -Location $loc.DisplayName | ? {$_.PublisherName -like "microsoft*"}
Get-AzVMImageOffer -Location $loc.DisplayName -PublisherName "MicrosoftWindowsServer"
Get-AzVMImageSku -Location "west europe" -PublisherName "MicrosoftWindowsServer" -Offer "WindowsServer"


New-AzVM -name "TrainingVM" -Image UbuntuLTS -ResourceGroupName $rg.ResourceGroupName -OpenPorts 22 -Location $rg.Location

#Get/Create custom RBAC role
# Moved to Security

###########################
###Working with ARM templates
###########################

#Get templates
$template = New-AzTemplateSpec -ResourceGroupName $rg.ResourceGroupName -Name "vm2ith2nics" -TemplateFile 'C:\Users\aasch\OneDrive\Training\Azure Development\Demos\vmWith2Nics.json' -Location $rg.Location 

#Get template from Azure tenmplate spec library
$tS = Get-AzTemplateSpec -Name vmWith2Nics -ResourceGroupName training01

# Deploy an ARM template
New-AzResourceGroupDeployment -Name TrainingDeployment -ResourceGroupName $rg.ResourceGroupName -TemplateParameterObject $tS

Disconnect-AzAccount

#####################
# Fehlerbehandlung falls Modul AZ nicht funktioniert
###############################
Import-Module Az.Accounts
#Fehler anzeigen
$Error[0].Exception | fl * -force
#Execution policy ggf anpassen
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned


###Storage account erstellen

Connect-AzAccount
New-AzStorageAccount
