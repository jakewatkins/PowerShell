#
#
#
#
#

function SetupAdminCredentials
{
	$userName = "administrator"
	$password = convertto-securestring -string "not my password" -AsPlainText -force
	$global:credential = new-object -typename System.Management.Automation.PSCredential -argumentList $userName, $password
}
export-modulemember -function SetupAdminCredentials 
