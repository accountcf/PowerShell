Import-Csv -Path "C:\user\List_winscp.xlsx" | ForEach-Object {
    $group = $_.group
    $user = $_.user
Write-Output "$group"
}
Write-Output "test"
Pause