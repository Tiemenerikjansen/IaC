using 'test.bicep' extends

param location string = 'westeurope'
param environment string = 'dev'
param storageAccountName string = 'mystorageaccount'
param tags object = {
  environment: environment
  location: location
}
param skuName string = 'Standard_LRS'
param containerName string = 'mycontainer'
param blobName string = 'myblob.txt'
param content string = 'Hello, Bicep!'
param publicAccess string = 'Blob'
param enableSoftDelete bool = true
param softDeleteRetentionDays int = 7
param enableVersioning bool = true
param enableChangeFeed bool = true
param enableEncryption bool = true


