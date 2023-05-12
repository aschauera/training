@description('Default location will be the location of the associated resource group')
param location string = resourceGroup().location
@minLength(3)
@maxLength(24)
@description('Provide a unique name for the storage account')
param storageName string = 'storage${uniqueString(resourceGroup().id)}' //Creates a unique name with prefix and id
@description('VNet Name 1')
param subnetName string = 'subNet${uniqueString(resourceGroup().id)}'
@description('Provide a name for the virtual network')
param vnetName string = 'vnet${uniqueString(resourceGroup().id)}'
@description('Provide a name for the virtual network')
param vmName string = 'vm${uniqueString(resourceGroup().id)}'

var nicName = 'nic${uniqueString(vmName)}'
var ipName = 'ip${uniqueString(vmName)}'

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

resource networkInterface 'Microsoft.Network/networkInterfaces@2020-11-01' = {
  name: nicName
  location: location
  properties: {
    ipConfigurations: [
      {
        name: ipName
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: virtualNetwork.properties.subnets[0].id
          }
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

//**Create the VM
resource windowsVM 'Microsoft.Compute/virtualMachines@2020-12-01' = {
  name: 'name'
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_A2_v2'
    }
    osProfile: {
      computerName: vmName
      adminUsername: 'adminUsername'
      adminPassword: 'adminPassword'
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2012-R2-Datacenter'
        version: 'latest'
      }
      osDisk: {
        name: 'name'
        caching: 'ReadWrite'
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterface.id //Reference the network interface resource with the attached VNET
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
        storageUri:  diagnosticStorage.properties.primaryEndpoints.blob //Reference the storage account URL
      }
    }
  }
}
