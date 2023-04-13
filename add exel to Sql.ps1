$File = "I:\SMS.xlsx"
$Instance = "HSB-CNTT-ANHLN1"
$Database = "DATA"

$fileName =  [System.IO.Path]::GetFileNameWithoutExtension($File)

foreach($sheet in Get-ExcelSheetInfo $File)
{

$data = Import-Excel -Path $File -WorksheetName $sheet.name | ConvertTo-DbaDataTable
$tablename = $fileName + '-' + $sheet.Name

Write-DbaDataTable -SqlInstance $Instance -Database $Database -InputObject $data -AutoCreateTable -Table $tablename

}

Write-host = "done"