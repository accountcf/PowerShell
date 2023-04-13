
$excelFile = "C:\user\List_winscp.xlsx"


$excelObj = New-Object -ComObject Excel.Application


$workbook = $excelObj.Workbooks.Open($excelFile)


$worksheet = $workbook.Worksheets.Item(1)


$rowMax = ($worksheet.UsedRange.Rows).count


for ($i=2; $i -le $rowMax; $i++) {
    
    $group = $worksheet.Cells.Item($i, 1).Value2
    $user = $worksheet.Cells.Item($i, 2).Value2
       Add-ADGroupMember -Identity $group -Members $user
}


$workbook.Close($false)
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($workbook)
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excelObj)
Write-Output "author: Anhln1"
Pause
