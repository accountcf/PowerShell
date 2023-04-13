import-excel C:\user\List_winscp.xlsx -WorksheetName Sheet1 -ImportColumns @(1, 2) -startrow 1 -endrow 92 -NoHeader -DataOnly
#lấy data từ exel
$user = $data.user
$group = $data.group
Write-Output "$data.user"
Write-Output "$data.group"

pause