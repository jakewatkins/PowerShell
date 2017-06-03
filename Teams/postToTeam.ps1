$webHookURL = "https://outlook.office.com/webhook/3abb05b9-f689-409b-a008-103377ece2b6@231dd9cd-ddc7-4fba-ae78-9f4ac3c912e7/IncomingWebhook/9425af9348b14b709e155f3a06bf9136/428422ba-54e0-4325-a053-021d4c293b6d"

$body = ConvertTo-JSON @{
    text = 'Hello Channel'
}

Invoke-RestMethod -uri $webHookURL -Method Post -body $body -ContentType 'application/json'