$username = "lpb\anhln0"
$password = "2016May@1709"
$secstr = New-Object -TypeName System.Security.SecureString
$password.ToCharArray() | ForEach-Object {$secstr.AppendChar($_)}
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $secstr
Invoke-Command -FilePath "C:\user\dhcp.ps1" -Credential $cred -Computer localhost