targetScope = 'subscription'

var prefix = 'ebi1'
var resoucegroupName = '${prefix}vm'

resource vmresourcegroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resoucegroupName
  location: 'JapanEast'
}



module vm 'vm.bicep' = {
  scope: vmresourcegroup
  name: 'vm-deploy'
  params: {
    storageAccountName: '${prefix}vmst'
    vmName: '${prefix}vm'
    vmSize: 'Standard_D2s_v3'
    adminUsername: 'mebisuda'
    adminPassword: 'AzureP@ss0wrd'
    vnetName: '${prefix}vnet'
    publicIPaddressName: '${prefix}pubip'
    nicName: '${prefix}nic'
    networkSecurityGroupName: '${prefix}nsg'
    OSVersion: '2019-datacenter-gensecond'
  }
}
