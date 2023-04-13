$users=Get-Content C:\user\user.txt

ForEach ($user in $users)

{

Disable-ADAccount -Identity $user

write-host "user $($user) has been disabled"

}