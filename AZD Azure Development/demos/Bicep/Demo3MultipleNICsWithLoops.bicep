param networkInterfaceName string = 'nic${uniqueString(resourceGroup().id)}'
param location string = resourceGroup().location
var numberOfInstances = 2
param virtualNetworkName string = 'vnet'
param subnetName string = 'subnet'

var subnetRef = resourceId('Microsoft.Network/virtualNetworks/subnets', virtualNetworkName, subnetName)

//** Create multiple NICs with for loops
resource networkInterface 'Microsoft.Network/networkInterfaces@2021-05-01' = [for i in range(0, numberOfInstances): {
  name: '${networkInterfaceName}${i}'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: subnetRef
          }
          loadBalancerBackendAddressPools: [
            {
              id: resourceId('Microsoft.Network/loadBalancers/backendAddressPools', loadBalancerName, 'BackendPool1')
            }
          ]
        }
      }
    ]
  }
  dependsOn: [
    virtualNetwork
    loadBalancer
  ]
}]
