let mysql      = require('mysql');
let connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'root',
  port: '3306',
  database : 'testdb'
});

connection.connect();

module.exports = connection