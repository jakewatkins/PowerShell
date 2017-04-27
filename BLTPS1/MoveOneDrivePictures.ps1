# count up how many file need to be move
$logFile = "C:\Users\jakew\Documents\logs\pictureArchive.txt"
$jpegCount = (get-childitem -Path "F:\Users\Jakew\SkyDrive\Pictures\Camera Roll\*.jpg" | where-object {$_.LastWriteTime -lt (get-date).AddDays(-30)} | Measure-Object).count
$mp4Count = (get-childitem -Path "F:\Users\Jakew\SkyDrive\Pictures\Camera Roll\*.mp4" | where-object {$_.LastWriteTime -lt (get-date).AddDays(-5)} | Measure-Object).count
$date = (get-date).ToString("yyyyMMdd")

Add-Content -path $logFile -value ("$date - processing $jpegCount pictures and $mp4Count videos")

# move the pictures
get-childitem -Path "F:\Users\Jakew\SkyDrive\Pictures\Camera Roll\*.jpg" | where-object {$_.LastWriteTime -lt (get-date).AddDays(-30)} | move-item -destination "F:\Media\Pictures\Camera Roll" -Force

# move the videos
get-childitem -Path "F:\Users\Jakew\SkyDrive\Pictures\Camera Roll\*.mp4" | where-object {$_.LastWriteTime -lt (get-date).AddDays(-5)} | move-item -destination "F:\Media\Video\CellPhone" -Force
