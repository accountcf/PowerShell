Get-AdGroupMember -Identity 'nhothunhapmienbac' | Get-AdUser -Properties * | Select Name,Mail | Export-csv -Path C:\user\nhothunhapmienbac.csv  -NoTypeInformation