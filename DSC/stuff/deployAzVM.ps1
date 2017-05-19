$date = Get-Date
$location = "East US"
#$resourceGroup = "jkwresgroup" + $date.ToString("yyyyMMdd")
$resourceGroup = "jkwDSC"
$templatejFile = "C:\Work\SourceCode\AzureVM\AzureVM4\jkwAppServer\jkwAppServer\WindowsVirtualMachine.json"
$parameters    = "C:\Work\SourceCode\AzureVM\AzureVM4\jkwAppServer\jkwAppServer\WindowsVirtualMachine.parameters.json"

SetupAzureLogin

#New-AzureRmResourceGroup -Name $resourceGroup -location $location

New-AzureRmResourceGroupDeployment -ResourceGroupName $resourceGroup -TemplateFile $templatejFile `
		-TemplateParameterFile $parameters

