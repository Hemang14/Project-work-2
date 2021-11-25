const mysql = require('mysql');
var connection = mysql.createConnection({
    host : 'localhost',
    user : 'root',
    password : 'Hemang@2001',
    database : 'onlinecinemaajk'
});

connection.connect();

module.exports = connection;
