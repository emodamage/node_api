const express = require('express')

//  导入data文件 (测试的数据)
// const data = require('./test/data')

// 导入解决跨域的包
const cors = require('cors')

// 导入router文件 路由文件
const router = require('./router')

const app = express()
// const port = 3000

// 使用解决跨域的包
app.use(cors())

// 如果没设置，可以用过postman将信息加入到数据库，但浏览器发送的信息是json格式的，
// 如果没有对数据进行过滤，那么写了信息的加入到数据库中显示是underfined
// 没写的就是空的
// 将json格式的数据转化为对象格式
app.use(express.json())

// 解析post的数据格式 (必须)
//#region 
// 在body中的x-www-form-urlencoded格式
// 如果值为false或没写，则req.body是underfined
//#endregion

app.use(express.urlencoded({
    extended: true
}))

//  开放静态资源文件assets
//#region 
// app.use(express.static('assets'))
// 通过 http://localhost:3000/images/test.png 访问
//#endregion

// 必须在端口号后写/api
// 通过 http://localhost:3000/api/images/test.png 访问
app.use('/api',express.static('assets'))


//先引入静态文件，再引入路由
//#region 
// 使用路由
// 可以引入多个路由
// app.use('/', router1)
//#endregion
app.use('/api', router)

// 如果路由没指定前缀并且有同样的路径，则会优先显示路由的信息
app.get('/', (req,res) => {
    res.send('hello word!')
})

// 练习代码
//#region 
// app.get('/news', (req,res) => {
//     res.send({
//         success: true,
//         msg: "",
//         info: data
//     })
// })
//#endregion

app.listen(3000, () => {
    console.log(`服务器监听在 http://localhost:3000`)
})
// app.listen(port, () => {
//     console.log(`服务器监听在 http://localhost:${port}`)
// })