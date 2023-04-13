Import-Module ActiveDirectory
Search-ADAccount –LockedOut |
 Select -Property Name,DistinguishedName |
 Export-CSV "C:\LockedOutADUsers.csv" -NoTypeInformation -Encoding UTF8