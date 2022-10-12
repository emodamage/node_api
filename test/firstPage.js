const express = require('express')
const data = require('./data')
const app = express()

// 查
app.get('/',(req,res) => {
    res.send({
        info: `get请求了一些首页数据`
    })
})
// app.get('/news',(req,res) => {
//     res.send({
//         info: 'get请求返回了一些新闻数据',
//         status: 200,
//         result: data
//     })
// })
// // 增
// app.post('/post', (req,res) => {
//     res.send(`<h2>增加成功</h2>`)    
// })
// // 删
// app.delete('/delete', (req,res) => {
//     res.send(`<h2>删除成功</h2>`)
// })
// // 改
// app.put('/update', (req,res) => {
//     res.send(`<h2>修改成功</h2>`)
// })

app.listen(3050, () => {
    console.log(`服务器监听在 http://localhost:3050`)
})