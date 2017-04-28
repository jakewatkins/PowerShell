$date = Get-Date
$location = "East US"
$resourceGroup = "jkwresgroup" + $date.ToString("yyyyMMdd")
SetupAzureLogin

New-AzureRmResourceGroup -Name $resourceGroup -location $location

New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroup -TemplateFile ".\azuredeploy.json" -TemplateParameterFile ".\azuredeploy.parameters.json"
