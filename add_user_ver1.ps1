import-excel C:\user\List_winscp.xlsx -WorksheetName Sheet1 -ImportColumns @(1, 2) -startrow 1 -endrow 92
#lấy data từ exel
$user = $data.user
$group = $data.group
# lấy user và add vào nhóm theo định danh
Add-ADGroupMember -Identity $group -Members $user

pause