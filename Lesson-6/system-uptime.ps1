# Get System Uptime
$lastBootTime = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
$currentTime = Get-Date
$uptime = $currentTime - $lastBootTime

Write-Host "Last Boot Up Time: $lastBootTime"
Write-Host "System Uptime: $($uptime.Days) days, $($uptime.Hours) hours, $($uptime.Minutes) minutes"