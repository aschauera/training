$resourceGroup = "<resource-group>"
$location = "westeurope"
$accountName = "";

Connect-AzAccount
# Locations 
Get-AzLocation | select Location

#New-AzResourceGroup -Name $resourceGroup -Location $location


New-AzStorageAccount -ResourceGroupName $resourceGroup -Name $accountName -Location $location -SkuName Standard_RAGRS -Kind StorageV2