$User  = Read-Host "Input SamAccountName"

$Email = (Get-Aduser $Users -Properties 'Mail').mail

if(-not($email)){
    $Email = Read-host -Prompt 'Email not found. Please Enter Manually'
}