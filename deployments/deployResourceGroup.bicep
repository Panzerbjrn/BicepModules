var Location = ${{ parameters.Region }}
var RGName = '${{ parameters.CustomerID }}RG'

// Setting target scope
targetScope = 'subscription'

// Creating resource group
resource rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: RGName
  location: Location
}
