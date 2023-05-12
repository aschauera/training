Find-Module -name Az #Check version of AZ
Connect-AzAccount
Get-AzSubscription -SubscriptionId 076688e2-d216-4def-80b8-240bf85d41b5 | Set-AzContext
$rg = New-AzResourceGroup -Name bicepdemo3
New-AzResourceGroupDeployment -ResourceGroupName $rg.ResourceGroupName -TemplateFile .\Demo1StorageAndVNet.bicep -prefix=bicepdemo3

#WhatIf
New-AzResourceGroupDeployment -ResourceGroupName $rg.ResourceGroupName -TemplateFile .\Demo1StorageAndVNet.bicep -prefix=bicepdemo3 -WhatIf
