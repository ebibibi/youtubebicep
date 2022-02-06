targetScope = 'subscription'

var resoucegroupName = 'youtubevm'

resource vmresourcegroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resoucegroupName
  location: 'JapanEast'
}



module vm 'vm.bicep' = {
  scope: vmresourcegroup
  
}
