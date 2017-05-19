param(
[parameter(Mandatory=$true)] [string] $Folder,
[parameter(Mandatory=$true)] [int] $Files,
[parameter(Mandatory=$true)] [int] $Size
)

write-host "Generating $Files each will be $size KB"


function MakeSeedString
{
	param(
	[parameter(Mandatory=$true)][int] $Size
	)
		
	#generate the 1Kb seed string
	for($counter = 0; $counter -lt 16; $counter++)
	{
		$seed =  $seed + [guid]::NewGuid().Guid -replace "-"
	}
	
	for($counter = 0; $counter -lt $Size; $counter++)
	{
		$seedBlock = $seedBlock + $seed
	}
	
	return $seedBlock
}

$seedBlock = MakeSeedString $Size
write-host $seedBlock.length

$date = (get-date).ToString("yyyyMMddhhmmss")

For($counter = 1; $counter -lt $Files; $counter++)
{
	#GetTempFileName eventually blows up if you are using a large number of files.  In fact you can only generate 65535 files with it.
	#$tmpName = [System.IO.Path]::GetFileNameWithoutExtension([System.IO.Path]::GetTempFileName()) + $counter.ToString() + ".tmp"
	$tmpName = "testFile$date$counter.tmp"
	$tempFileName = [System.IO.Path]::Combine($Folder, $tmpName)
	write-host "creating $tempFileName"
	$seedBlock | out-file $tempFileName
}

