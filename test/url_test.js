const url = require('url')
const querystring = require('querystring')

let address = 'https://www.baidu.com:8080/api/banner?id=info'
// 将网址分解
console.log(url.parse(address))

// 找出网址中的参数id=info
let params = url.parse(address).query
console.log(params)

// 将参数转化为对象{ id: 'info' }
let object = querystring.parse(params)
console.log(object)
