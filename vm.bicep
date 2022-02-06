param publicIPaddressName string

resource publicIP 'Microsoft.Network/publicIPAddresses@2021-05-01' = {
  name: publicIPaddressName
}

