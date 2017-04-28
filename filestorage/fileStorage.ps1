#
# fileStorage.ps1
# Upload 
#
#
#
param($uploadFile)

$configPath = $env:userProfile + "\Documents\storage.json"
$storageConfig = LoadJSONfile $configPath

$storageAccountName = $storageConfig.AccountName
$storageAccountKey = $storageConfig.AccountKey
$containerName = $storageConfig.Container

$blobName = [io.path]::GetFileName($uploadFile)

$storageContext = New-AzureStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $storageAccountKey

Set-AzureStorageBlobContent -File $uploadFile -Container $containerName -Blob $blobName -Context $storageContext
