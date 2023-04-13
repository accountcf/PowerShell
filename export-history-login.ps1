# Set variables for log file path, Event ID, and user account
$logPath = "C:\Logs\SignInLogs.csv"
$eventID = 4771
$userAccount = "lpb\anhnn2"

# Retrieve sign-in logs for the user from Active Directory
$events = Get-EventLog -LogName Security | Where-Object {$_.EventID -eq $eventID -and $_.ReplacementStrings[5] -eq $userAccount}

# Export sign-in logs to CSV file
$events | Export-Csv -Path $logPath -NoTypeInformation

# Verify that the log file was created
if (Test-Path $logPath) {
    Write-Host "Sign-in logs exported to $logPath" -ForegroundColor Green
} else {
    Write-Host "Error: Failed to export sign-in logs." -ForegroundColor Red
}
pause