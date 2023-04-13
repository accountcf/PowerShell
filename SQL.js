const sql = require('mssql');
const filepath = 'I:\SMS.xlsx';

const config = {
    user: 'sa',
    password: '84Ngoc@nh156',
    server: 'HSB-CNTT-ANHLN1',
    database: 'SQL',
    options: {
        encrypt: true
    }
}

sql.connect(config, err => {
    if (err) console.log(err);

    const request = new sql.Request();
    request.query(`
        SELECT * INTO my_table
        FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0',
        'Excel 12.0 Xml;Database=${filepath}',
        'SELECT * FROM [Sheet1$]')
    `, (err, result) => {
        if (err) console.log(err);

        console.log(result);
    });
});
