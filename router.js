const express = require('express')

// 导入数据库相关的信息
const {conMysql} = require('./db')

const fs = require('fs')
const multer = require('multer')
// const path = require('path')

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
// router.post('/test', multer({
//     dest: 'public/image',
// }).array('file', 1),
// function (req, res, next) {

//     console.log('file1', req.body.file)
//     let file = req.body.file
//     let path = 'public/image/' + Date.now().toString() + '_' + file.originalname
//     // 覆盖
//     fs.renameSync('./public/image/' + file.filename, path);

//     console.log('file', file)
//     let fileInfo = {}
//     fileInfo.type = file.mimetype
//     fileInfo.name = file.originalname
//     fileInfo.size = file.size
//     fileInfo.path = path
//     res.json({
//         code: 200,
//         msg: 'ok',
//         data: fileInfo
//     })
// })

// router.post('/test1', multer({
//     dest: 'public/image',
// }).array('file', 1),
// function (req, res, next) {

//     // console.log('file1', req.body.file)
//     let file = req.files[0]
//     let path = 'public/image/' + Date.now().toString() + '_' + file.originalname
//     // 覆盖
//     fs.renameSync('./public/image/' + file.filename, path);

//     console.log('file', file)
//     let fileInfo = {}
//     fileInfo.type = file.mimetype
//     fileInfo.name = file.originalname
//     fileInfo.size = file.size
//     fileInfo.path = path
//     res.json({
//         code: 200,
//         msg: 'ok',
//         data: fileInfo
//     })
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

// 注册用户
router.post('/register', (req, res) => {
  let username = req.body.form.username
  let password = req.body.form.password
  let power = req.body.form.power
  let phone = req.body.form.phone
  let department = req.body.form.department
  let sex = req.body.form.sex
  let imgUrl = 'http://localhost:3000/api/image/default.jpg'

  let sql = `insert ignore into users values (null, ?, ?, ?, ?, ?, ?, ?)`
  let arr = [username, password, power, phone, department, sex, imgUrl]
  conMysql(sql, arr, result => {
    if (result.affectedRows > 0) {
      res.send({
          info: '注册成功',
          status: 200
      })
    } else {
      res.send({
          info: '用户名已重复，请重新输入',
          status: 0
      })
    }
  })
})

// 用户登录
router.post('/login', (req, res) => {
  // console.log(req.body)
  // console.log(req.query)
  // console.log(req.params)
  // console.log(req.body.form)
  let username = req.body.form.username
  let password = req.body.form.password
  let power = req.body.form.power


  let sql = `select * from users where username= ? and password= ? and power = ?`
  let arr = [username, password, power]

  let menuData = []
  if (power == 1) {
    menuData = [
      {
        path: '/home',
        name: 'home',
        label: '首页',
        icon: 's-home',
        url: 'Home/Home'
      },
      {
        path: '/connect',
        name: 'connect',
        label: '交流中心',
        icon: 'user',
        url: 'Connect/Connect'
      },
      {
        label: '调度中心',
        icon: 'location',
        children: [
        {
            path: '/dispatch',
            name: 'dispatch',
            label: '调度',
            icon: 'setting',
            url: 'Dispatch/Dispatch'
          },
          {
            path: '/dispatch/in',
            name: 'in',
            label: '入货记录表',
            icon: 'setting',
            url: 'Dispatch/In'
          },
          {
            path: '/dispatch/out',
            name: 'out',
            label: '出货记录表',
            icon: 'setting',
            url: 'Dispatch/Out'
          }
        ]
      },
      {
        path: '/goods',
        name: 'goods',
        label: '物资管理',
        icon: 'video-play',
        url: 'Goods/Goods'
      },
      {
        path: '/user',
        name: 'user',
        label: '用户管理',
        icon: 'user',
        url: 'User/User'
      },
      {
        path: '/system',
        name: 'system',
        label: '系统管理',
        icon: 'user',
        url: 'System/System'
      },
      {
        label: '其他',
        icon: 'location',
        children: [
          {
            path: '/page1',
            name: 'page1',
            label: '页面1',
            icon: 'setting',
            url: 'Other/Page1'
          },
          {
            path: '/page2',
            name: 'page2',
            label: '页面2',
            icon: 'setting',
            url: 'Other/Page2'
          }
        ]
      },
      {
        label: '个人中心',
        icon: 'location',
        children: [
          {
            path: '/personal1',
            name: 'personal1',
            label: '个人中心1',
            icon: 'setting',
            url: 'Personal/Personal1'
          },
          {
            path: '/personal2',
            name: 'personal2',
            label: '个人中心2',
            icon: 'setting',
            url: 'Personal/Personal2'
          }
        ]
      }
    ]
  } else if (power == 2) {
    menuData = [
      {
        path: '/home',
        name: 'home',
        label: '首页',
        icon: 's-home',
        url: 'Home/Home'
      },
      {
        path: '/connect',
        name: 'connect',
        label: '交流中心',
        icon: 'user',
        url: 'Connect/Connect'
      },
      {
        label: '调度中心',
        icon: 'location',
        children: [
          {
            path: '/dispatch/out',
            name: 'out',
            label: '出货记录表',
            icon: 'setting',
            url: 'Dispatch/Out'
          }
        ]
      },
      {
        path: '/goods',
        name: 'goods',
        label: '物资管理',
        icon: 'video-play',
        url: 'Goods/Goods'
      },
      {
        label: '其他',
        icon: 'location',
        children: [
          {
            path: '/page1',
            name: 'page1',
            label: '页面1',
            icon: 'setting',
            url: 'Other/Page1'
          },
          {
            path: '/page2',
            name: 'page2',
            label: '页面2',
            icon: 'setting',
            url: 'Other/Page2'
          }
        ]
      },
      {
        label: '个人中心',
        icon: 'location',
        children: [
          {
            path: '/personal1',
            name: 'personal1',
            label: '个人中心1',
            icon: 'setting',
            url: 'Personal/Personal1'
          },
          {
            path: '/personal2',
            name: 'personal2',
            label: '个人中心2',
            icon: 'setting',
            url: 'Personal/Personal2'
          }
        ]
      }
    ]
  } else {
    menuData = [
      {
        path: '/home',
        name: 'home',
        label: '首页',
        icon: 's-home',
        url: 'Home/Home'
      },
      {
        path: '/connect',
        name: 'connect',
        label: '交流中心',
        icon: 'user',
        url: 'Connect/Connect'
      },
      {
        label: '调度中心',
        icon: 'location',
        children: [
          {
            path: '/dispatch/in',
            name: 'in',
            label: '入货记录表',
            icon: 'setting',
            url: 'Dispatch/In'
          }
        ]
      },
      {
        path: '/goods',
        name: 'goods',
        label: '物资管理',
        icon: 'video-play',
        url: 'Goods/Goods'
      },
      {
        label: '其他',
        icon: 'location',
        children: [
          {
            path: '/page1',
            name: 'page1',
            label: '页面1',
            icon: 'setting',
            url: 'Other/Page1'
          },
          {
            path: '/page2',
            name: 'page2',
            label: '页面2',
            icon: 'setting',
            url: 'Other/Page2'
          }
        ]
      },
      {
        label: '个人中心',
        icon: 'location',
        children: [
          {
            path: '/personal1',
            name: 'personal1',
            label: '个人中心1',
            icon: 'setting',
            url: 'Personal/Personal1'
          },
          {
            path: '/personal2',
            name: 'personal2',
            label: '个人中心2',
            icon: 'setting',
            url: 'Personal/Personal2'
          }
        ]
      }
    ]
  }

  conMysql(sql, arr, result => {
    // console.log(result);
    if (result.length > 0) {
      res.send({
        info: '登录成功',
        status: 200,
        result,
        menuData
      })
    } else {
      res.send({
        info: '登录失败',
        status: 0,
        msg: '查找不到该用户'
      })
    }
  })
  console.log('/login') 
})

// 获取用户信息
router.get('/userList', (req, res) => {
  console.log('/userList')

  let currentPage = req.query.currentPage ? req.query.currentPage : 0
  let size = req.query.size ? req.query.size : 8
  currentPage = currentPage * size
  
  currentPage = Number(currentPage)
  size = Number(size)

  let sql1 = `select * from users order by id desc limit ?,?`
  let arr1 = [currentPage, size]

  let sql2 = `select count(*) as count from users`
  let arr2 = []

  let result = ''
  conMysql(sql1, arr1, result1 => {
    result = result1
  })
  conMysql(sql2, arr2, result2 => {
    console.log(result2[0].count)
    res.send({
      info: '获取用户信息',
      status: 200,
      result,
      count: result2[0].count
    })
  })  
})

// 修改用户信息
router.post('/updateUser', (req, res) => {
  let username = req.body.form.username
  let password = req.body.form.password
  let sex = req.body.form.sex
  let phone = req.body.form.phone
  let department = req.body.form.department

  let sql =  `update users set password = ?, sex = ?, phone = ?, department = ? where username = ?`
  let arr = [password, sex, phone, department, username]
  conMysql(sql, arr, result => {
    res.send({
      info: '修改了用户信息',
      // affectedRows为一说明影响了一行
      status: result.affectedRows,
      result
    })
  })
})

// 头像上传
router.post('/imgUpload', multer({
  dest: 'public/image',
}).array('file', 1),
function (req, res, next) {
  const { username } = req.body
  // console.log('body',req.body)
  // body [Object: null prototype] { test: 'test1111' }

  let file = req.files[0]
  let path = 'public/image/' + username + '.' + file.originalname.split('.')[1]
  // 覆盖
  fs.renameSync('./public/image/' + file.filename, path);

  let fileInfo = {}
  fileInfo.type = file.mimetype
  fileInfo.name = file.originalname
  fileInfo.size = file.size
  fileInfo.path = path

  let imgUrl  = `http://localhost:3000/api/image/${username}.jpg`

  let sql =  `update users set imgUrl = ? where username = ?`
  let arr= [imgUrl, username]
  new Promise((resolve, reject) => {
    conMysql(sql, arr, result1 => {
      resolve(result1.affectedRows)
    })
  }).then(result => {
    res.json({
      status: 200,
      msg: 'ok',
      data: fileInfo,
      result
    })
  })
})

// 获取echarts物资信息
router.get('/echartsList', (req, res) => {
  let power = req.query.power
  let sql = ''

  if (power == 1) {
    sql = 'select * from manage_goods order by rand() limit 10'
  } else if (power == 2) {
    sql = 'select * from provide_goods order by rand() limit 10'
  } else {
    sql = 'select * from buyer_goods order by rand() limit 10'
  }
  let arr = []

  conMysql(sql, arr, result => {
    res.send({
      info: '获取echarts物资信息',
      status: 200,
      result
    })
  }) 
})

// 获取热销榜单数据
router.get('/hotList', (req, res) => {
  let power = req.query.power
  let sql = ''

  if (power == 1) {
    sql ='select * from manage_goods order by number limit 6'
  } else if (power == 2) {
    sql = 'select * from provide_goods order by number limit 6'
  } else {
    sql = 'select * from buyer_goods order by number limit 6'
  }
  let arr = []

  conMysql(sql, arr, result => {
    res.send({
      info: '获取热销榜单数据',
      status: 200,
      result
    })
  }) 
})

// 获取物资信息
router.get('/goodsList', (req, res) => {
  console.log('/goodList')
  // 设置允许跨域的域名，*代表允许任意域名跨越 (单一繁琐，已简写，cors)
  //#region 
  // res.header("Access-Control-Allow-Origin","*")
  //#endregion
  
  // 封装的函数所需，如果不需要用，就把封装的函数的arr去掉
  // 但是用到了这个函数的都要改
  let power = req.query.power
  let currentPage = req.query.currentPage ? req.query.currentPage : 0
  let size = req.query.size ? req.query.size : 8
  currentPage = currentPage * size
  let sql1 = ''
  currentPage = Number(currentPage)
  size = Number(size)

  if (power == 1) {
    // sql = `select * from manage_goods limit ${currentPage},${size}`
    sql1 = `select * from manage_goods order by time desc limit ?,?`
  } else if (power == 2) {
    sql1 = `select * from provide_goods order by time desc limit ?,?`
  } else {
    sql1 =`select * from buyer_goods order by time desc limit ?,?`
  }
  let arr1 = [currentPage, size]

  let sql2 = ''
  if (power == 1) {
      sql2 = `select count(*) as count from manage_goods`
  } else if (power == 2) {
      sql2 = `select count(*) as count from provide_goods`
  } else {
      sql2 =`select count(*) count from buyer_goods`
  }
  let arr2 = []

  let result = ''
  conMysql(sql1, arr1, result1 => {
    result = result1
  })
  conMysql(sql2, arr2, result2 => {
    console.log(result2[0].count)
    res.send({
      info: '获取物资信息',
      status: 200,
      result,
      count: result2[0].count
    })
  })  
})

// 增加物资
router.post('/addGoods', (req, res) => {
    console.log('/addGoods')
    let power = req.body.power
    let name = req.body.form.name
    let price = req.body.form.price
    price = Number(price)
    let number = req.body.form.number
    let place = req.body.form.place
    let manufacturers = req.body.form.manufacturers
    let descs = req.body.form.descs
    let time = req.body.form.time
    let isDisinfect = req.body.form.isDisinfect
    // console.log(power)
    // console.log(name)
    // console.log(price)
    // console.log(number)
    // console.log(place)
    // console.log(manufacturers)
    // console.log(desc)
    let sql = ``
    if (power == 1) {
        sql = `insert ignore into manage_goods values(null, ?, ?, ?, ?, ?, ?, ?, ?)`
    } else if (power == 2) {
        sql = `insert ignore into provide_goods values(null, ?, ?, ?, ?, ?, ?, ?, ?)`
    } else {
        sql = `insert ignore into buyer_goods values(null, ?, ?, ?, ?, ?, ?, ?, ?)`
    }
    let arr = [name, price, number, place, manufacturers, descs, time ,isDisinfect]

    conMysql(sql, arr, result => {
        if (result.affectedRows > 0) {
            res.send({
                info: '注册插入的物资信息成功',
                status: result.affectedRows,
                result
            })
        }
        else{
            console.log('注册插入错误')
            res.send({
                info: '物资名已重复，请重新输入',
                status: 0
            })
        }
    })     
})

// 根据名字修改物资信息
router.put('/updateGoods', (req, res) => {
    let power = req.body.power
    let name = req.body.form.name
    let price = req.body.form.price
    price = Number(price)
    let number = req.body.form.number
    let place = req.body.form.place
    let manufacturers = req.body.form.manufacturers
    let descs = req.body.form.descs
    let isDisinfect = req.body.form.isDisinfect

    let sql = ''
    if (power == 1) {
        console.log(111)
        sql =  `update manage_goods set price = ?, number = ?, place = ?, manufacturers = ?, descs = ?, isDisinfect = ? where name = ?`
    } else if (power == 2) {
        sql =  `update provide_goods set price = ?, number = ?, place = ?, manufacturers = ?, descs = ?, isDisinfect = ?  where name = ?`
    } else {
        sql =  `update buyer_goods set price = ?, number = ?, place = ?, manufacturers = ?, descs = ?, isDisinfect = ?  where name = ?`
    }
    let arr = [price, number, place, manufacturers, descs, isDisinfect, name]

    conMysql(sql, arr, result => {
        res.send({
            info: '修改了物资信息',
            // affectedRows为一说明影响了一行
            status: result.affectedRows,
            result
        })
    })   
})

// 根据名字删除物资
router.delete('/deleteGoods', (req, res) => {
    let power = req.body.power
    let name = req.body.form.name
    
    let sql =''
    if (power == 1) {
        sql = `delete from manage_goods where name = ?`
    } else if (power == 2) {
        sql = `delete from provide_goods where name = ?`
    } else {
        sql = `delete from buyer_goods where name = ?`
    }
    let arr = [name]

    conMysql(sql, arr, result => {
        res.send({
            info: '删除了物资信息',
            // affectedRows为一说明影响了一行
            status: result.affectedRows,
            result
        })
    })  
})

// 搜索物资信息
router.get('/searchGoods', (req, res) => {
    console.log('/searchGoods')

    let power = req.query.power
    let searchValue = req.query.searchValue
    let currentPage = req.query.currentPage ? req.query.currentPage : 0
    let size = req.query.size ? req.query.size : 8
    currentPage = currentPage * size
    currentPage = Number(currentPage)
    size = Number(size)
    searchValue = `%${String(searchValue)}%`
    // console.log('power', power)
    // console.log('searchValue', searchValue)
    // console.log('power', power)
    let sql1 = ''
    if (power == 1) {
        sql1 = `select * from manage_goods where name like ? ORDER BY time desc limit ?, ?`
        // select * from manage_goods where name like '%?%' ORDER BY time desc
    } else if (power == 2) {
        sql1 = `select * from provide_goods where name like ? ORDER BY time desc limit ?, ?`
    } else {
        sql1 =`select * from buyer_goods where name like ? ORDER BY time desc limit ?, ?`
    }
    let arr1 = [searchValue, currentPage, size]


    let sql2 = ''
    if (power == 1) {
        sql2 = `select count(*) as count from manage_goods where name like ?`
        // select * from manage_goods where name like '%?%' ORDER BY time desc
    } else if (power == 2) {
        sql2 = `select count(*) as count from provide_goods where name like ?`
    } else {
        sql2 =`select count(*) as count from buyer_goods where name like ?`
    }
    let arr2 = [searchValue]

    let result = ''
    conMysql(sql1, arr1, result1 => {
        result = result1
    }) 
    conMysql(sql2, arr2, result2 => {
        res.send({
            info: '获取物资信息',
            result,
            count: result2[0].count
        })
    }) 
})

// 按price过滤物资列表 (price) 地址栏显示参数和值
// 浏览器中只能用req.query
http://localhost:3000/api/search?price=x
router.get('/search', (req,res) => {
    let price = req.query.price ? eq.query.price : 20
    // console.log(req.params)
    // console.log(req.body)
    // console.log(req.query)

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
// 浏览器中只能用req.params
http://localhost:3000/api/search/x
router.get('/search/:price', (req,res) => {
    // // 浏览器中只能用params
    console.log(req.params)
    console.log(req.body)
    console.log(req.query)
    
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

/* Module 登录注册模块 
-------------------------------------------------*/
// 登录 (username, password)
// router.get('/login', (req, res) => {
//     let username = req.query.username
//     let password = req.query.password

//     // let sql = `select * from users where username= '${username}' and password= '${password}'`
//     // conMysql(sql, result => {
//     //     res.send({
//     //         info: '登录信息',
//     //         result
//     //     })
//     // }) 

//     let sql = `select * from users where username= ? and password= ?`
//     let arr = [username, password]
//     conMysql(sql, arr, result => {
//         console.log(result);
//         res.send({
//             info: '登录信息',
//             result
//         })
//     }) 

//     // 练习代码
//     //#region 
//     // con.query(sql, (error, result) => {
//     //     if (error) {
//     //         console.log('查询错误')
//     //         return
//     //     }
//     //     res.send({
//     //         info: '查询结果',
//     //         result
//     //     })
//     // })
//     //#endregion
// })

// // 提交登录信息 (username, password, power)
// router.post('/register', (req, res) => {

//     // 设置允许跨域的域名，*代表允许任意域名跨越 (单一繁琐，已简写，cors)
//     //#region 
//     // res.header("Access-Control-Allow-Origin", "*")
//     //#endregion

//     let username = req.body.username
//     let password = req.body.password
//     let power = req.body.power

//     let form = req.body.form
//     console.log('query', req.query)
//     console.log('body', req.body)
//     console.log('params', req.params)
//     // console.log(req.body)

//     // 解析post请求中body的x-www-form-urlencoded格式 
//     //#region 
//     // 如果值为true，req.body变为对象格式
//     // console.log(req.body)
//     // { username: 'admin', password: 'admin' }
//     // 如果值为false或没写，则req.body是underfined
//     // 用来解析post请求中body的x-www-form-urlencoded格式
//     // app.use(express.urlencoded({
//     //     extended: false
//     // }))
//     //#endregion
    
//     // 练习中的代码
//     //#region 
//     // if( username == 'admin' && password == 'admin'){
//     //     res.send({
//     //         info: '提交的信息',
//     //         msg: '提交成功',
//     //         username,
//     //         password
//     //     })
//     // }
//     // else{
//     //     res.send({
//     //         error: '用户或密码错误'
//     //     })
//     // }
//     //#endregion
    
//     // console.log(`username: ${username}`)
//     // console.log(`password: ${password}`)
//     // console.log(`power: ${power}`)

//     // 防postman中 没输值, 账户密码输入长度有问题， power值不在0|1中 的情况
//     if (username == undefined || password == undefined || 
//         power == undefined || username.length < 4 || 
//         username.length > 8 || password.length < 4 || 
//         password.length > 8 || power != 1|0) {
//         console.log(`传过来的参数为{
//             username: ${username},
//             password: ${password},
//             power: ${power}
//         }`)
//         res.send({
//             info: '传到服务器的参数有问题',
//             result: `传到服务器的参数为{
//                 username: ${username},
//                 password: ${password},
//                 power: ${power}
//             }`
//         })
//         return
//     }

//     console.log(`username: ${username}`)
//     console.log(`password: ${password}`)
//     console.log(`power: ${power}`)

//     // sql = `insert ignore into users values (null, '${username}', '${password}', '${power}')`
//     // conMysql(sql, result => {
//     //     console.log(result)
//     //     // result.affectedRows表示影响的行数
//     //     if (result.affectedRows > 0) {
//     //         res.send({
//     //             info: '注册成功',
//     //             status: 1
//     //         })
//     //     }
//     //     else{
//     //         console.log('注册插入错误')
//     //         res.send({
//     //             info: '用户名已重复，请重新输入',
//     //             status: 0
//     //         })
//     //     }
//     // })

//     sql = `insert ignore into users values (null, ?, ?, ?)`
//     let arr = [username, password, power]
//     conMysql(sql, arr, result => {
//         // console.log(result)
//         // result.affectedRows表示影响的行数
//         if (result.affectedRows > 0) {
//             res.send({
//                 info: '注册成功',
//                 status: 1
//             })
//         }
//         else{
//             console.log('注册插入错误')
//             res.send({
//                 info: '用户名已重复，请重新输入',
//                 status: 0
//             })
//         }
//     })
// })

// 增加物资 (name, price, number)
// 浏览器中只能用req.body
router.post('/add', (req, res) => {
    // 浏览器中只能用body
    // console.log(req.body)
    // console.log(req.params)
    // console.log(req.query)

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
            // affectedRows为一说明影响了一行
            status: result.affectedRows,
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

// 根据名字来修改物资数量
// 浏览器中只能用req.body
router.put('/update', (req, res) => {
    // 在postman body里面写数据能接受到,但是在浏览器中只能用这个
    // console.log(req.body)
    // // 不能接受
    // console.log(req.params)
    // // postman在地址栏配参数和值能接受到
    // console.log(req.query);

    let name = req.body.name
    let number = req.body.number

    // console.log(name);
    // console.log(number);

    let sql = `update goods set number = ? where name = ?`
    let arr = [number, name]

    conMysql(sql, arr, result => {
        res.send({
            info: '修改物资信息',
            // affectedRows为一说明影响了一行
            status: result.affectedRows,
            result
        })
    })   
})


// 根据名字删除物资
// 浏览器中只能用req.body
router.delete('/delete', (req, res) => {
    // postman里body能接受 浏览器中只能用这个
    // console.log(req.body)
    // 不能接受
    // console.log(req.params)
    // 地址栏可以接受
    // console.log(req.query)
    
    let name = req.body.name

    let sql = `delete from goods where name = ?`

    let arr = [name]

    conMysql(sql, arr, result => {
        res.send({
            info: '删除物资信息',
            // affectedRows为一说明影响了一行
            status: result.affectedRows,
            result
        })
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