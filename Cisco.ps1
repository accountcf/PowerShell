secpasswd = ConvertTo-SecureString "anhln1" -AsPlainText -Force
$creds = New-Object System.Management.Automation.PSCredential ("anh@3214#", $secpasswd)
 
#Build SSH session
New-SSHSession -ComputerName "10.33.69.248" -Credential $creds -AcceptKey $true
#Build open stream for use in cisco devices
$session = Get-SSHSession -Index 0
$stream = $session.Session.CreateShellStream("dumb", 0, 0, 0, 0, 1000)
$stream.Write("config t`n")
$stream.Write("int gig 0/2`n")
$stream.Write("shutdown`n")
$stream.Write("do logout`n")
$stream.Write("logout`n")
Remove-SSHSession -Index 0