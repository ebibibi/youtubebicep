targetScope = 'subscription'

var resoucegroupName = 'youtube6'
var storageAccountName = 'youtubeebisuda6'



resource test 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resoucegroupName
  location: 'JapanEast'
}

module storage 'storage.bicep' = {
  scope: test
  name: 'storage-deploy'

  params: {
    storageAccountName: storageAccountName
  }
}
