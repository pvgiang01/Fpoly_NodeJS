var express = require('express')
var router = express.Router()
var productController = require('../controllers/products')
var userController = require('../controllers/users')
var upload = require('../commons/upload')
var bcrypt = require('bcryptjs')
var jwt = require('jsonwebtoken')
var mid = require('../commons/authenticate')

/* GET index page. */
router.get('/products', async function(req, res, next) { 
  let list = await productController.getListProducts()
  res.json(list)
})

/* GET detail page. */
router.get('/products/:id', async function(req, res, next) {
  let product = await productController.getProductById(req.params)
  res.json(product)
})

var middleAddProduct = [upload.single('img')]
/* POST add new page. */
router.post('/add-product', middleAddProduct, async function (req, res, next) {  
  let { body } = req
  if (req.file) {
    let imgUrl = req.file.originalname
    body = {...body, img: imgUrl}
  }
  const p = await productController.addNew(body)
  res.json(p)
})

/* DELETE product */
router.delete('/delete/:id', async function (req, res, next) {
  let { params } = req
  const p = await productController.remove(params)
  res.json(p)
})


/* POST edit product. */
router.post('/edit-product/:id', middleAddProduct, async function (req, res, next) {
  let { params, body } = req
  if (req.file) {
    let imgUrl = req.file.originalname
    body = {...body, img: imgUrl}
  }
  const p = await productController.edit(params, body)
  res.json(p)
})

/* POST search product. */
router.post('/search-product/', middleAddProduct, async function (req, res, next) {
  let { body } = req  
  const p = await productController.search(body.keyword)
  res.json(p)
})



/* POST search product. */
router.post('/register', async function (req, res, next) {
  let { username, password } = req.body  
  let hashedPassword = bcrypt.hashSync(password, 8);
  const p = await userController.register(username, hashedPassword)
  res.json({username: p.username, id: p._id})
})



/* POST search product. */
router.post('/login', async function (req, res, next) {
  let { username, password } = req.body 
  const user = await userController.login(username)
  if(!user){
    res.status(401).json({auth: false, msg: 'Username not found'})
  }
  var passwordIsValid = bcrypt.compareSync(password, user.password);
  if(!passwordIsValid){
    res.status(401).json({auth: false, msg: 'Password not valid'})
  }
  
  let token = jwt.sign({id: user._id}, process.env.JWT_KEY);
  res.status(200).json({token, auth: true})
})


/* GET my info. */
router.get('/my-info', mid.verifyToken, async function(req, res, next) {
  let {userId} = req
  let user = await userController.getById(userId)
  res.status(200).json(user)
})




module.exports = router;
