var express = require('express')
var router = express.Router()
var productController = require('../controllers/productController')
var upload = require('../commons/upload')
var userController = require('../controllers/userController')
var jwt = require('jsonwebtoken')


/* GET index page. */
router.get('/products', async function (req, res, next) {
  let danhSachSP = await productController.getListProducts()
  res.json(danhSachSP)
})


/* GET detail page. */
router.get('/products/:id', async function (req, res, next) {
  let { id } = req.params
  let product = await productController.getProductById(id)
  res.json(product)
})


/* GET detail page. */
router.get('/products/fields/:id', async function (req, res, next) {
  let { id } = req.params
  let product = await productController.getProductByIdSelectedFields(id)
  res.json(product)
})

var mid = [upload.single('img')]
/* POST add new page. */
router.post('/add-product', mid, async function (req, res, next) {
  let { body } = req
  if (req.file) {
    let imgUrl = req.file.originalname
    body = { ...body, img: imgUrl }
  }
  const product = await productController.addNew(body)
  res.json(product)
})



/* POST login page. */
router.post('/login', async function(req, res, next) {
  let {username, password} = req.body
  let user = await userController.login(username)
  if(!user)  res.status(401).json({auth: false, msg: 'Not auth'})

  let token = jwt.sign({ user }, process.env.JWT_KEY);
  res.status(200).json({auth: true, token: token})
});





module.exports = router
