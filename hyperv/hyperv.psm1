#
#
#
#
#

function LoadJSONfile
{
	param(
		[parameter(Mandatory=$true)] $jsonFile
	)
	
	[System.Reflection.Assembly]::LoadWithPartialName("System.Web.Extensions")
	
	#read the file
	$fileData = get-content 
	
	$serializer = New-Object System.Web.Script.Serialization.JavaScriptSerializer
	$obj = $serializer.DeserializeObject($fileData)
}
export-modulemember -function LoadJSONfile

function getVMIpAddresses
{
	get-vm | ? {$_.State -eq "Running"} | select -ExpandProperty networkadapters | select vmname, ipaddresses
}
export-modulemember -function getVMIpAddresses

function getVMIpAddress 
{
	param(
		$name
	)
	get-vm | ? {$_.Name -eq $name } | select -ExpandProperty networkadapters | select vmname, ipaddresses
}
export-modulemember -function getVMIpAddress

function GetVMConfigFile
{
	param(
		$directory
	)
	
	$file = Get-ChildItem $directory -filter *.vmcx
	
	return $file
}

function ImportVM
{
	param(
		$newVMName,
		$vmTemplateName		
	)
	
	$vmBaseDir = "D:\Virtual Machines\"
	$templateBase = "E:\VirtualMachineBackups\"
	$vmTemplate = $templateBase + $vmTemplateName + "\Virtual Machines\"

	$vmConfigFile = $templateBase + $vmTemplateName + "\Virtual Machines\" + (GetVMConfigFile $vmTemplate).Name
	
	$newVMDir = $vmBaseDir + $newVMName
	
	if(Test-Path -Path $newVMDir)
	{
		write-host "New VM already exists!"
		exit 1
	}
	
	#create a folder for the new vm
	new-item -ItemType directory -Path $newVMDir
	
	$importedVM = Import-Vm -Path $vmConfigFile -VhdDestinationPath $newVMDir -VirtualMachinePath $newVMDir -SmartPagingFilePath $newVMDir -SnapshotFilePath $newVMDir -Copy -GenerateNewId
	
	rename-vm $importedVM -NewName $newVMName
}
export-modulemember -function ImportVM 

function RemoveVM
{
	param(
		$vmName
	)
			
	$vmBaseDir = "D:\Virtual Machines\"
	$vmDir = $vmBaseDir + $vmName
	
	remove-vm $vmName -force
	
	remove-item $vmDir -recurse -force
}
export-modulemember -function RemoveVM

function RDPToVM
{
	param(
		$vmName
	)
	
	$ipAddress = (getVMIpAddress $vmName).IPAddresses[0]
	
	start-process "$env:windir\system32\mstsc.exe" -argumentList "/v:$ipAddress"
}
export-modulemember -function RDPToVM