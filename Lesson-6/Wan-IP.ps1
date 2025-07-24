# Get Current Public IP Address
try {
    $publicIp = (Invoke-RestMethod -Uri "http://ipecho.net/plain")
    Write-Host "Your public IP address is: $publicIp" -ForegroundColor Green
}
catch {
    Write-Host "Could not retrieve public IP address. Please check your internet connection." -ForegroundColor Red
}