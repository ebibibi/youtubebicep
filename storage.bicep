param storageAccountName string

resource storage 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: storageAccountName
  location: 'japaneast'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
