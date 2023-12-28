const sql = require("mysql");

const connection = sql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "raj05",
  multipleStatements: true,
});

module.exports = connection;
