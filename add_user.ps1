# Load the Excel file
$excel = New-Object -ComObject Excel.Application
$workbook = $excel.Workbooks.Open("C:\user\List_winscp.xlsx")
$worksheet = $workbook.Worksheets.Item(1)

# Get the data from the specified columns
$group = $worksheet.Columns.Item(1).UsedRange.Value2
$user = $worksheet.Columns.Item(2).UsedRange.Value2

# Iterate through the data and add users to groups
for ($i = 2; $i -le $worksheet.UsedRange.Rows.Count; $i++) {
    $user = $user[$i, 1]
    $group = $group[$i, 1]

    Add-ADGroupMember -Identity $group -Members $user
}

# Close the Excel file
$workbook.Close()
$excel.Quit()
Pause
