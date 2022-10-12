//qs和querystring结果一样,但querystring已被弃用
// const querystring = require('querystring')
const qs = require('qs')
let params = 'username=qq&password=123'
let object = {
    username: 'admin',
    password: '123456'
}
console.log(qs.parse(params))
console.log(qs.stringify(object))
// qs.parse(params)
// qs.stringify(object)

