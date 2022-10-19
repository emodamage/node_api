const express = require('express')

// 导入数据库相关的信息
const {conMysql} = require('./db')

// 练习代码
//#region 
//#region 
// const mysql = require('mysql')
// 导入data文件 (测试的数据)
// const data = require('./test/data')
//#endregion

// // 连接数据库的信息 (已简写, db.js)
// const con = mysql.createConnection({
//     host: 'localhost',
//     user: 'root',
//     password: 'root123',
//     database: '2019',
//     port: '3306'
// })
//#endregion

const router = express.Router()

// 解决跨域问题
// 下面2句等于下面一大串 (语法糖)
// const cors = require('cors')
// app.use(cors())
// 能运用到下面所有路由
// router.all('*', function (req, res, next) {
//     // 设置允许跨域的域名，*代表允许任意域名跨越
//     res.header("Access-Control-Allow-Origin","*")
//     // 允许的header的类型
//     res.header("Access-Control-Allow-Headers","content-type")
//     // 跨域允许的请求方式
//     res.header("Access-Control-Allow-Methods","DELETE, PUT, POST, GET, OPTIONS")
//     if (req.method.toLowerCase() == 'option') {
//         res.send(200) //让option方式请求快点结束
//     }
//     else{
//         next()
//     }    
// })

router.get('/', (req, res) => {
    let username = req.query.username
    let password = req.query.password
    if (username && password){
        res.send({
            info: "输入的账号信息",
            username,
            password
        })
    }
    else{
        res.send({
            info: "未输入用户名或密码"
        })
    }

})

// 请求物资列表
// router.get('/list', (req, res) => {
// #region
//     // 设置允许跨域的域名，*代表允许任意域名跨越
//     // res.header("Access-Control-Allow-Origin","*")
//     res.send({
//         info: '物资信息',
//         data
//     })
// })
// #endregion

// 获取物资信息
router.get('/list', (req, res) => {

    // 设置允许跨域的域名，*代表允许任意域名跨越 (单一繁琐，已简写，cors)
    //#region 
    // res.header("Access-Control-Allow-Origin","*")
    //#endregion
    
    // 封装的函数所需，如果不需要用，就把封装的函数的arr去掉
    // 但是用到了这个函数的都要改
    let arr = []
    let sql = 'select * from goods'
    conMysql(sql, arr, result => {
        res.send({
            info: '获取物资信息',
            result
        })
    }) 

    // 练习代码
    // con.query(sql, (error, result) => {
    //     if (error) {
    //         console.log('连接错误')
    //         return
    //     }
    //     res.send({
    //         info: '物资信息',
    //         result
    //     })      
    // }) 
})

// 按price过滤物资列表 (price) 地址栏显示参数和值
http://localhost:3000/api/search?price=x
router.get('/search', (req,res) => {
    let price = req.query.price

    // 练习代码
    //#region 
    // 1.filter方式
    //#region 
    // filter放回了新数组，需要return
    // result = data.filter((item) =>{
    //     return item.price > price
    // })
    // result = data.filter(
    //     item => item.price > price
    // )
    //#endregion
    // // 2.for方式
    //#region 
    // // let result = []
    // // for(let i = 0; i < data.length; i++){
    // //     if(data[i].price > price){
    // //         result.push(data[i])
    // //     }
    // // }
    // res.send({
    //     success: true,
    //     msg: "商品信息",
    //     result
    // })
    //#endregion
    //#endregion

    // let sql = `select * from goods where price > '${price}'`
    // conMysql(sql, result => {
    //     res.send({
    //         info: `超过${price}的物资信息`,
    //         result
    //     })
    // }) 

    // ?自带了''
    let sql = `select * from goods where price > ?`
    let arr = [price]
    conMysql(sql, arr, result => {
        res.send({
            info: `超过${price}的物资信息`,
            result
        })
    }) 
})

// 按price过滤物资列表 (price) 地址栏只显示值
http://localhost:3000/api/search/x
router.get('/search/:price', (req,res) => {
    let price = req.params.price
    let sql = `select * from goods where price > ?`
    let arr = [price]
    conMysql(sql, arr, result => {
        res.send({
            info: `超过${price}的物资信息`,
            result
        })
    }) 
})

// router.get('/add', (req, res) => {
// #region
//     let sql = 'insert into goods values(null, "棉签", 2.5, 10)'
//     con.query(sql, (error, result) => {
//         if (error) {
//             console.log('插入错误')
//             return
//         }
//         res.send({
//             info: '插入语句信息',
//             result
//         })
//     }) 
// })
// #endregion

// 增加物资 (name, price, number)
router.post('/add', (req, res) => {
    let name = req.body.name
    let price = req.body.price
    let number = req.body.number

    // let sql = `insert into goods values(null, '${name}', '${price}', '${number}')`
    // conMysql(sql, result => {
    //     res.send({
    //         info: '插入的物资信息',
    //         result
    //     })
    // }) 

    let sql = `insert into goods values(null, ?, ?, ?)`
    let arr = [name, price, number]
    conMysql(sql, arr, result => {
        res.send({
            info: '插入的物资信息',
            result
        })
    })     
    // 练习代码
    //#region 
    // con.query(sql, (error, result) => {
    //     if (error) {
    //         console.log('插入错误')
    //         return
    //     }
    //     res.send({
    //         info: '插入语句信息',
    //         result
    //     })
    // }) 
    //#endregion
})

// 登录 (username, password)
router.get('/login', (req, res) => {
    let username = req.query.username
    let password = req.query.password

    // let sql = `select * from users where username= '${username}' and password= '${password}'`
    // conMysql(sql, result => {
    //     res.send({
    //         info: '登录信息',
    //         result
    //     })
    // }) 

    let sql = `select * from users where username= ? and password= ?`
    let arr = [username, password]
    conMysql(sql, arr, result => {
        res.send({
            info: '登录信息',
            result
        })
    }) 

    // 练习代码
    //#region 
    // con.query(sql, (error, result) => {
    //     if (error) {
    //         console.log('查询错误')
    //         return
    //     }
    //     res.send({
    //         info: '查询结果',
    //         result
    //     })
    // })
    //#endregion
})

// 提交登录信息 (username, password, power)
router.post('/register', (req, res) => {

    // 设置允许跨域的域名，*代表允许任意域名跨越 (单一繁琐，已简写，cors)
    //#region 
    // res.header("Access-Control-Allow-Origin", "*")
    //#endregion

    let username = req.body.username
    let password = req.body.password
    let power = req.body.power
    // console.log(req.body)

    // 解析post请求中body的x-www-form-urlencoded格式 
    //#region 
    // 如果值为true，req.body变为对象格式
    // console.log(req.body)
    // { username: 'admin', password: 'admin' }
    // 如果值为false或没写，则req.body是underfined
    // 用来解析post请求中body的x-www-form-urlencoded格式
    // app.use(express.urlencoded({
    //     extended: false
    // }))
    //#endregion
    
    // 练习中的代码
    //#region 
    // if( username == 'admin' && password == 'admin'){
    //     res.send({
    //         info: '提交的信息',
    //         msg: '提交成功',
    //         username,
    //         password
    //     })
    // }
    // else{
    //     res.send({
    //         error: '用户或密码错误'
    //     })
    // }
    //#endregion
    
    // console.log(`username: ${username}`)
    // console.log(`password: ${password}`)
    // console.log(`power: ${power}`)

    // 防postman中 没输值, 账户密码输入长度有问题， power值不在0|1中 的情况
    if (username == undefined || password == undefined || 
        power == undefined || username.length < 4 || 
        username.length > 8 || password.length < 4 || 
        password.length > 8 || power != 1|0) {
        console.log(`传过来的参数为{
            username: ${username},
            password: ${password},
            power: ${power}
        }`)
        res.send({
            info: '传到服务器的参数有问题',
            result: `传到服务器的参数为{
                username: ${username},
                password: ${password},
                power: ${power}
            }`
        })
        return
    }

    console.log(`username: ${username}`)
    console.log(`password: ${password}`)
    console.log(`power: ${power}`)

    // sql = `insert ignore into users values (null, '${username}', '${password}', '${power}')`
    // conMysql(sql, result => {
    //     console.log(result)
    //     // result.affectedRows表示影响的行数
    //     if (result.affectedRows > 0) {
    //         res.send({
    //             info: '注册成功',
    //             status: 1
    //         })
    //     }
    //     else{
    //         console.log('注册插入错误')
    //         res.send({
    //             info: '用户名已重复，请重新输入',
    //             status: 0
    //         })
    //     }
    // })

    sql = `insert ignore into users values (null, ?, ?, ?)`
    let arr = [username, password, power]
    conMysql(sql, arr, result => {
        console.log(result)
        // result.affectedRows表示影响的行数
        if (result.affectedRows > 0) {
            res.send({
                info: '注册成功',
                status: 1
            })
        }
        else{
            console.log('注册插入错误')
            res.send({
                info: '用户名已重复，请重新输入',
                status: 0
            })
        }
    })
})

// 封装了访问数据库的操作 (已模块化, db.js)
// #region
// function conMysql (sql, callback) {
//     con.query(sql, (error, result) => {
//         if (error) {
//             console.log('错误')
//             return
//         }
//         // res.send({
//         //     info: '插入语句信息',
//         //     result
//         // })
//         callback(result)
//     }) 
// }
//#endregion

module.exports = router