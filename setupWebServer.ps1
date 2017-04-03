# create a new web server
write-host "creating new vm"
importVM webServer1 winsvr2016base

#start it and wait for it to be ready
StartVMAndWait webServer1
#Start-Sleep -milliseconds 5000

$ipAddress = (getVMIpAddress webServer1).IPAddresses[0]

#setup my user  (creats a global variable called $global:credential
SetupAdminCredentials

write-host "installing web-server"
# start a new session with the server we just spun up.  the name is fixed in the template
$s1 = new-pssession -computername $ipAddress -credential $global:credential

# install IIS on the web-server
invoke-command -session $s1 -scriptblock {install-windowsfeature -name "Web-Server" -IncludeAllSubFeature } 

write-host "renaming vm to WebS`erver1"
invoke-command -session $s1 -scriptblock {Rename-computer -newname WebServer1}

# reboot the web-serverrestar
invoke-command -session $s1 -scriptblock {Restart-Computer -Force}

write-host "WebServer1 is restarting.  Please wait."
# wait for the vm to come back up
vmWait webServer1



