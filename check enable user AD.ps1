$infile = "C:\user\Users.txt"  
$users = Get-Content $infile  
foreach ($user in $users){ Get-ADUser -Filter {name -like $user -or samaccountname -like $user} | Select Name, SamAccountName,Enabled } 