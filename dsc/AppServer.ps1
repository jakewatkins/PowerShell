configuration AppServerBuild {
	param ( 
		$ServerName 
	)
	
	node ( $ServerName ) {
		WindowsFeature WebServer {
			Ensure = "Present"
			Name = "Web-Server"
			IncludeAllSubFeature = $true
		}
		
		WindowsFeature NET-Framework-Features {
			Ensure = "Present"
			Name = "NET-Framework-Features"
			IncludeAllSubFeature = $true
		}
		
		WindowsFeature NET-Framework-45-Features {
			Ensure = "Present"
			Name = "NET-Framework-45-Features"
			IncludeAllSubFeature = $true
		}
		
		WindowsFeature MSMQ {
			Ensure = "Present"
			Name = "MSMQ"
			IncludeAllSubFeature = $true
		}
	}
}

AppServerBuild -ServerName jkwTest1
