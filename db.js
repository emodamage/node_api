const mysql = require('mysql')

/**
 * 数据库信息配置
 * @host: 主机名
 * @user: 用户名
 * @password: 密码
 * @database: 数据库名称
 * @port: 端口号 
 */
const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root123',
    database: '2019',
    port: '3306'
})

// con.connect()

/**query函数参数
 * @param {*} sql sql语句
 * @param {*} arr 数据参数[arg1, arg2, ...] 如不选，则前面用到此函数的参数要改u
 * @param {*} callback 回调函数, 返回执行结果
 */
function conMysql (sql, arr, callback) {
    // console.log('sql', sql)
    // console.log('arr1', arr)
    con.query(sql, arr, (error, result) => {
        if (error) {
            console.log('error', error)
            return
        }
        // console.log('arr2', arr)
        // console.log('result', result)
        // res.send({
        //   info: '插入语句信息',
        //   result
        // })

        callback(result)
        // console.log(result);
    }) 
}

// con.end()

module.exports = {
    // con,
    conMysql
}