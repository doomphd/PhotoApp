const mysql = require('mysql2');


// const pool = mysql.createPool({
//     host: "LocalHost",
//     user: "root",
//     password: "4576478Tt!",
//     database: "csc317db",
//     connectionLimit: 50,
//     debug: false,
// });

const pool = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "4576478Tt!",
    database: "ttcsc317db",
    connectionLimit: 50,
    debug: false,
});


 const promisePool = pool.promise();
 module.exports = promisePool;

//module.exports = pool;