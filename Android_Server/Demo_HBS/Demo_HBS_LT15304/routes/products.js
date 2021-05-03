var express = require('express');
var router = express.Router();
var checkLogin = require('../commons/authenticate.js')
var upload = require('../commons/upload')
var productController = require('../controllers/productController')
var categoryController = require('../controllers/categoryController')



/* GET home page. */
router.get('/', checkLogin.check, async function (req, res, next) {
  let list = await productController.getListProducts()
  res.render('products', { list })
})

/* GET add new page. */
router.get('/add-product', async function (req, res, next) {
  let loaiSP = await categoryController.getListCategories()
  res.render('new-product', { loaiSP });
})

var mid = [checkLogin.check, upload.single('img')]
/* POST add new page. */
router.post('/add-product', mid, async function (req, res, next) {
  let { body } = req
  if (req.file) {
    let imgUrl = req.file.originalname
    body = { ...body, img: imgUrl }
  }

  await productController.addNew(body)
  res.redirect('/products')
})

/* GET edit product page. */
router.get('/edit-product/:id', async function (req, res, next) {
  let id = req.params.id
  let prod = await productController.getProductById(id)
  let loaiSP = await categoryController.getListCategories()
  console.log('>>>>>>', prod, loaiSP)
  res.render('edit-product', { product: prod, loaiSP });
})

/* POST edit product. */
router.post('/edit-product/:id', mid, async function (req, res, next) {
  let { id } = req.params
  let { body } = req
  if (req.file) {
    let imgUrl = req.file.originalname
    body = { ...body, img: imgUrl }
  }
  await productController.edit(id, body)
  res.redirect('/products')
});


/* DELETE product */
router.delete('/delete/:id', async function (req, res, next) {
  let { id } = req.params
  await productController.remove(id)
  res.send({ res: true })
});



/* GET search result. */
router.get('/search/:value', function (req, res, next) {
  let { value } = req.params
  let result = danhSachSP.filter(sp =>
    sp.productName.toLowerCase().includes(value.toLowerCase())) || []
  res.send({ result, loaiSP })
});



module.exports = router;
