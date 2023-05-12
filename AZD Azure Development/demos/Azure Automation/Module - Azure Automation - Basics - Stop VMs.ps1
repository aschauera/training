Param(
 [string]$resourceGroup,
 [string]$VMName,
 [string]$method,
 [string]$UAMI 
)

# Get current state of VM
$status = (Get-AzVM -ResourceGroupName $resourceGroup -Name $VMName `
    -Status -DefaultProfile $AzureContext).Statuses[1].Code

Write-Output "`r`n Beginning VM status: $status `r`n"

# Start or stop VM based on current state
if($status -eq "Powerstate/deallocated")
    {
        Start-AzVM -Name $VMName -ResourceGroupName $resourceGroup -DefaultProfile $AzureContext
    }
elseif ($status -eq "Powerstate/running")
    {
        Stop-AzVM -Name $VMName -ResourceGroupName $resourceGroup -DefaultProfile $AzureContext -Force
    }

# Get new state of VM
$status = (Get-AzVM -ResourceGroupName $resourceGroup -Name $VMName -Status `
    -DefaultProfile $AzureContext).Statuses[1].Code  

Write-Output "`r`n Ending VM status: $status `r`n `r`n"

Write-Output "Account ID of current context: " $AzureContext.Account.Id