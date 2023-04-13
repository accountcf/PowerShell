Get-WinEvent -FilterHashtable @{LogName='Security';ID=4771;TargetUserName='l1-anhln1'} | Export-Csv -Path C:\logs\eventlog.csv -NoTypeInformation
