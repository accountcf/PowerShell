$user = Read-Host "Nhập user người dùng: "
$Length = 8
$characters = 'abcdefghkmnprs@!$%&?*+#tuvwxyz23456789@!$%&?*+#QWERTYUIOPLKJ@!$%&?*+#HGFDSAZXazqwsxedcrfvrfvtgbtgbyhnujmikolpCVBNM@!$%&?*+#ABCDEFQWBMNHKGJOHPIYOASZX'
$password = -join ($characters.ToCharArray() | 
Get-Random -Count $Length) 

$password 
Set-ADAccountPassword -Identity $user -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "$password" -Force)
Write-Host 'Mật Khẩu mới của bạn là :' $password
Start-Sleep -Seconds 30
