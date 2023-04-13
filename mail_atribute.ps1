$User = Read-Host -Prompt 'Input SamAccountName'




if(Get-Aduser $User -Properties Mail | Select-Object mail){
    $Email = Get-Aduser $Users -Properties 'Mail' | select-Object mail
}else{$Email = Read-host -Prompt 'Email not found. Please Enter Manually'}