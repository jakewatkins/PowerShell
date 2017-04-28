$hostname = "jkwvmnet20170420.eastus.cloudapp.azure.com"
$winrmPort = '5986'

$userName = "vmAdmin"
$password = Convertto-securestring "Ph0ne.Mouse.Paper.Card" -AsPlainText -Force
$cred = new-object -typename System.Management.Automation.PSCredential -argumentList $userName, $password

$soptions = New-PSSessionOption -SkipCACheck
$global:session = new-pssession -ComputerName $hostname -port $winrmport -Credential $cred -SessionOption $soptions -UseSSL
