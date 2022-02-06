param publicIPaddressName string
param nicName string
param vnetName string

resource publicIP 'Microsoft.Network/publicIPAddresses@2021-05-01' = {
  name: publicIPaddressName
  location: resourceGroup().location
}

resource vnet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: vnetName
  location: resourceGroup().location
  properties: { 
    addressSpace: {
      addressPrefixes: [
        '10.1.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'default'
        properties: {
          addressPrefix: '10.1.0.0/24'
        }
      }
    ]
  }
}


resource nic 'Microsoft.Network/networkInterfaces@2021-05-01' = {
  name: nicName
  location: resourceGroup().location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: vnet.properties.subnets[0]
        }
      }
    ] 
  }
}
