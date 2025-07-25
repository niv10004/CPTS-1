﻿# List Processes with High Memory Usage
Get-Process | Sort-Object -Property WS -Descending | Select-Object -First 10 ProcessName, @{Name="Memory (MB)"; Expression={$_.WS / 1MB -as [int]}}, Id | Format-Table -AutoSize
