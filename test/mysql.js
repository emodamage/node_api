// 引入mysql包
const mysql = require('mysql')

const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root123',
    database: '2019',
    port: '3306'
})

// con.connect()

// let sql = 'insert into goods(id, name, price) values(5, "防护镜", 150.50)'
let sql = 'select * from goods'
con.query(sql, function (error, result) {
    if (error) {
        console.log('数据库sql错误')
        return
    }
    console.log(result)

    // 插入，修改，删除中result的结果
    // OkPacket {
    //     fieldCount: 0,
    //     affectedRows: 1,  影响的行数
    //     insertId: 4,      表中的id
    //     serverStatus: 2,
    //     warningCount: 0,
    //     message: '',
    //     protocol41: true,
    //     changedRows: 0
    //   }
})

// con.end()