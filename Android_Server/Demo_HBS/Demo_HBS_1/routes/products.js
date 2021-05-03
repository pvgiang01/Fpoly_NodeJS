var express = require('express');
var router = express.Router();
var checkLogin = require('../commons/authenticate')
var upload = require('../commons/upload')
var productController = require('../controllers/products')
var categoryController = require('../controllers/categories')



/* GET home page. */
router.get('/', async function (req, res, next) {
  let list = await productController.getListProducts()
  res.render('products', { list })
})

/* GET add new page. */
router.get('/add-product', async function (req, res, next) {
  let loaiSP = await categoryController.getListCategories()
  res.render('new-product', { loaiSP })
})

var middleAddProduct = [checkLogin.check, upload.single('img')]
/* POST add new page. */
router.post('/add-product', middleAddProduct, async function (req, res, next) {
  let imgUrl = req.protocol + '://' + req.headers.host + '/images/' + req.file.originalname
  req.body = {...req.body, img: imgUrl}
  await productController.addNew(req.body)
  res.redirect('/products')
})

/* GET edit product page. */
router.get('/edit-product/:id', async function (req, res, next) {
  let product = await productController.getProductById(req.params)
  let loaiSP = await categoryController.getListCategories()
  res.render('edit-product', { product, loaiSP })
})

/* POST edit product. */
router.post('/edit-product/:id', middleAddProduct, async function (req, res, next) {
  let { params, body } = req
  if (req.file) {
    let imgUrl = req.protocol + '://' + req.headers.host + '/images/' + req.file.originalname
    body = {...body, img: imgUrl}
  }
  await productController.edit(params, body)
  res.redirect('/products')
})

/* DELETE product */
router.delete('/delete/:id', async function (req, res, next) {
  let { params } = req
  await productController.remove(params)
  res.send({ res: true })
})

/* GET search result. */
router.get('/search/:value', async function (req, res, next) {
  let { params } = req
  let result = await productController.search(params)
  let loaiSP = await categoryController.getListCategories()
  res.send({ result, loaiSP })
})

module.exports = router;
