Import-Excel -Path "C:\user\List_winscp.csv" -WorksheetName Sheet1ses -ImportColumns @(1, 2) -startrow 1 -endrow 91 | ForEach-Object {
 $group = $_.'column1'
 $user = $_.'column2'
 Write-Output "$user"
  # Add-ADGroupMember -Identity $group -Members $user
}

   

Pause