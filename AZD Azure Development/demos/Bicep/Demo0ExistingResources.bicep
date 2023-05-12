//DEMO SETUP - create the storage account to use as EXISTING
@description('Provide a unique name for the storage account')
param storageName string = 'storage${uniqueString(resourceGroup().id)}' //Creates a unique name with prefix and id
param location string = resourceGroup().location

resource demoStorage 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: storageName
  location:location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
//DEMO - reference the existing storage resource
resource existingStorage 'Microsoft.Storage/storageAccounts@2019-06-01' existing = {
  name: storageName
}

output storageOut string = storageName
