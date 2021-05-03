var express = require('express');
var router = express.Router();
var middleware = require('../utilities/authenticate')



var danhSachSP = [
  {id: 1, productName: 'Nokia', price: 2000, published: '2020-05-20', idLoaiSP: 2},
  {id: 2, productName: 'Samsung', price: 3000, published: '2020-05-20', idLoaiSP: 1},
  {id: 3, productName: 'Apple', price: 4000, published: '2020-05-20', idLoaiSP: 3},
  {id: 4, productName: 'VSmart', price: 5000, published: '2020-05-20', idLoaiSP: 1},
  {id: 5, productName: 'Oppo', price: 6000, published: '2020-05-20', idLoaiSP: 4},
  {id: 6, productName: 'Xiaomi', price: 7000, published: '2020-05-20', idLoaiSP: 1},
  {id: 7, productName: 'Realme', price: 8000, published: '2020-05-20', idLoaiSP: 1},
  {id: 8, productName: 'Huawei', price: 9000, published: '2020-05-20', idLoaiSP: 5},
  {id: 9, productName: 'BPhone', price: 1000, published: '2020-05-20', idLoaiSP: 1},
  {id: 10, productName: 'Vertu', price: 11000, published: '2020-05-20', idLoaiSP: 2}
]

var loaiSP = [
  {id: 1, name: 'ABC'},
  {id: 2, name: 'DEF'},
  {id: 3, name: 'CCC'},
  {id: 4, name: 'DDD'},
  {id: 5, name: 'EEE'}
]

router.use(middleware.authenticate)

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('products', { list: danhSachSP, loaiSP });
});



/* GET add new page. */
router.get('/add-product', function(req, res, next) {
  res.render('new-product', {loaiSP});
});



/* POST add new page. */
router.post('/add-product', function(req, res, next) {
  let { productName, price, published, idLoaiSP } = req.body
  let newProduct = {
    id: 1000,
    productName: productName,
    price: price,
    published: published,
    idLoaiSP:idLoaiSP
  }
  danhSachSP.push(newProduct)

  res.redirect('/products')
});



/* GET edit page. */
router.get('/edit-product/:id', function(req, res, next) {
  let id = req.params.id
  let pro = danhSachSP.find(sp => sp.id == id) || {}
  res.render('edit-product', {pro, loaiSP});
});



/* POST edit page. */
router.post('/edit-product/:id', function(req, res, next) {
  let id = req.params.id
  let { productName, price, published, idLoaiSP } = req.body
  danhSachSP = danhSachSP.map(sp => sp.id == id ? {...sp, productName, price, published, idLoaiSP }: sp)
  res.redirect('/products')
});


/* GET filter. */
router.get('/filter/:s', function(req, res, next) {
  let {s} = req.params  
  let pros = danhSachSP.filter(sp => sp.productName.toLowerCase().includes(s.toLowerCase())) || danhSachSP
  if (s == 'all') {
    pros = danhSachSP
  }
  res.send({pros, loaiSP})
});

module.exports = router;
