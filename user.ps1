import-module ActiveDirectory
$csv = import-csv -path C:\user\username1.csv
foreach ($row in $csv)
{
$dName = $row.name
$SamAccountName = $row.samaccountname
$firstName = $row.firstname
$lastName = $row.lastname
$OU = $row.ou
$passwd = $row.password
$department = $row.department
$description = $row.description

$Userprincipalname_temp = $row.Userprincipalname

$Userprincipalname = $SamAccountName + "@" + $Userprincipalname_temp

New-ADUser -Name $dName -SamAccountName $SamAccountName -GivenName $firstName -Surname $lastName -Path $OU -AccountPassword (convertto-securestring $passwd -asplaintext -force) -ChangePasswordAtLogon $false -Department $department -Description $description -UserPrincipalName $Userprincipalname -Enabled $true

Write-host "da tao xong user $SamAccountName"

}