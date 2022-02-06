param publicIPaddressName string
param nicName string
param vnetName string

resource publicIP 'Microsoft.Network/publicIPAddresses@2021-05-01' = {
  name: publicIPaddressName
}

resource vnet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: vnetName
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
