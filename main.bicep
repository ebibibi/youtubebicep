targetScope = 'subscription'

var resoucegroupName = 'youtubevm'

resource vmresourcegroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resoucegroupName
  location: 'JapanEast'
}



module vm 'vm.bicep' = {
  scope: vmresourcegroup
  name: 'vm-deploy'
  params: {
    storageAccountName: 'youtubevmst'
    vmName: 'youtubevm'
    vmSize: 'Standard_D2s_v3'
    adminUsername: 'mebisuda'
    adminPassword: 'AzureP@ss0wrd'
    vnetName: 'youtubevnet'
    publicIPaddressName: 'youtubepubip'
    nicName: 'youtubenic'
    networkSecurityGroupName: 'youtubensg'
    OSVersion: '2019-datacenter-gensecond'
  }
}
