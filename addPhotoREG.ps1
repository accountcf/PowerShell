$myWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()
$myWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($myWindowsID)

$adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator

if ($myWindowsPrincipal.IsInRole($adminRole))
{
    $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)"
    $Host.UI.RawUI.BackgroundColor = "Darkred"
    clear-host
}
else
{
    $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
    $newProcess.Arguments = $myInvocation.MyCommand.Definition;
    $newProcess.Verb = "runas";
    [System.Diagnostics.Process]::Start($newProcess);
    exit
}

$servers = Get-Content c:\user\ip.txt

$HostedRegFile = "C:\user\Restore_Windows_Photo_Viewer_ALL_USERS.reg"
foreach ($server in $servers)
{
    $newfile = "\\$server\c`$\Downloads\RegistryFiles\"
    New-Item -ErrorAction SilentlyContinue -ItemType directory -Path \\$server\C$\Downloads\RegistryFiles\
    Copy-Item $HostedRegFile -Destination $newfile
    Invoke-Command -ComputerName $server -ScriptBlock {
        Start-Process -filepath "C:\windows\regedit.exe" -argumentlist "/s C:\user\Restore_Windows_Photo_Viewer_ALL_USERS.reg"
        Write-Host -NoNewLine "Press any key to continue..."
    }
}