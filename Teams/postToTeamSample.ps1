$webHookURL = "get your own webhook"

$body = ConvertTo-JSON @{
    text = 'Hello Channel'
}

Invoke-RestMethod -uri $webHookURL -Method Post -body $body -ContentType 'application/json'