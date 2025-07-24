$ComputerName = "localhost"
$Ports = @(21, 22, 23, 25, 80, 110, 135, 139, 445, 3389)

Write-Host "Checking ports on $ComputerName..."

foreach ($Port in $Ports) {
    $TestResult = Test-NetConnection -ComputerName $ComputerName -Port $Port -InformationLevel Quiet
    if ($TestResult) {
        Write-Host "Port $Port is open"
    }
}

Write-Host "Scan complete."