#
#
#
#
#

function SetupAdminCredentials
{
	$userName = "administrator"
	$password = convertto-securestring -string "Ph0ne.Mouse.Paper.Card" -AsPlainText -force
	$global:credential = new-object -typename System.Management.Automation.PSCredential -argumentList $userName, $password
}
export-modulemember -function SetupAdminCredentials 