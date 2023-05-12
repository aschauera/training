@description('Default location will be the location of the associated resource group')
param location string = resourceGroup().location
param prefix string = 'demo1'
@minLength(3)
@maxLength(24)
@description('Provide a unique name for the storage account')
param storageName string = 'storage${uniqueString(resourceGroup().id)}' //Creates a unique name with prefix and id
@description('VNet Name 1')
param subnetName string = '${prefix}subNet${uniqueString(resourceGroup().id)}'
@description('Provide a name for the virtual network')
param vnetName string = '${prefix}vnet${uniqueString(resourceGroup().id)}'

//** Create a virtual network
resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: '${subnetName}1' //Create a subnet by concatenating parameters and indizes
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
      {
        name: '${subnetName}2'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}

//** Create the storage
resource diagnosticStorage 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
