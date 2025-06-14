//https://learn.microsoft.com/en-us/azure/virtual-machines/windows/quick-create-bicep?tabs=CLI
param namePrefix string = 'unique'
param location string = resourceGroup().location

var name = '${namePrefix}-vnet'
var subnetName = 'main-subnet'

resource vnet_generic 'Microsoft.Network/virtualNetworks@2020-08-01' = {
  name: name
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/24'
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: '10.0.0.0/24'
          delegations: []
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: []
    enableDdosProtection: false
  }
}

output vnetId string = vnet_generic.id
output subnetId string = '${vnet_generic.id}/subnets/${subnetName}'
output subnetName string = subnetName


