#
#
#
#
#

$loc = "EastUS"
$resourceGroupName = "jkwDSC"

New-AzureRMResourceGroup -name $resourceGroupName -Location $loc

New-AzureRMStorageAccount -ResourceGroupName $resourceGroupName -Name dscscripts -Location $loc -SkuName "Standard_GRS"
Set-azurermstorageaccount -name dscscripts -resourcegroupname $resourceGroupName
New-AzureRMStorageContainer -Name scripts -Permission Blob
Publish-azurermvmdscconfiguration -ConfigurationPath "D:\sourcecode\guerillaprogrammer\powershell\dsc\appserver.ps1" `
	-StorageAccountName dscscripts -RescourceGroupName $resourceGroupName -Container scripts