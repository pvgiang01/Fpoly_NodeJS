var express = require('express');
var router = express.Router();
var checkLogin = require('../commons/authenticate')

var danhSachSP = [
  {id: 1, productName: 'Nokia', price: 2000, published: '2020-05-20', idLoaiSP: 1},
  {id: 2, productName: 'Samsung', price: 3000, published: '2020-05-20', idLoaiSP: 2},
  {id: 3, productName: 'Apple', price: 4000, published: '2020-05-20', idLoaiSP: 3},
  {id: 4, productName: 'VSmart', price: 5000, published: '2020-05-20', idLoaiSP: 4},
  {id: 5, productName: 'Oppo', price: 6000, published: '2020-05-20', idLoaiSP: 1},
  {id: 6, productName: 'Xiaomi', price: 7000, published: '2020-05-20', idLoaiSP: 3},
  {id: 7, productName: 'Realme', price: 8000, published: '2020-05-20', idLoaiSP: 4},
  {id: 8, productName: 'Huawei', price: 9000, published: '2020-05-20', idLoaiSP: 2},
  {id: 9, productName: 'BPhone', price: 1000, published: '2020-05-20', idLoaiSP: 1},
  {id: 10, productName: 'Vertu', price: 11000, published: '2020-05-20', idLoaiSP: 1}
]


var loaiSP =[
  {id: 1, name: 'Dien thoai'},
  {id: 2, name: 'Laptop'},
  {id: 3, name: 'May tinh bang'},
  {id: 4, name: 'Tivi'}
]

router.use(checkLogin.check)

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { list: danhSachSP, loaiSP });
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
    idLoaiSP: idLoaiSP
  }
  danhSachSP.push(newProduct)

  res.redirect('/products')
});



/* GET edit product page. */
router.get('/edit-product/:id',function(req, res, next) {
  let id = req.params.id
  let prod = danhSachSP.find(sp => sp.id == id)

  res.render('edit-product', {product: prod, loaiSP});
});

/* POST edit product. */
router.post('/edit-product/:id',function(req, res, next) {
  let id = req.params.id
  let { productName, price, published, idLoaiSP } = req.body
  
  danhSachSP.forEach(pro => {
    if (pro.id == id) {
      pro.productName = productName
      pro.price = price
      pro.published = published
      pro.idLoaiSP = idLoaiSP
    }
  })

  // danhSachSP = danhSachSP.map(pro => pro.id == id ? 
  //   {...pro, productName: productName, price: price, published: published}:
  //   pro)

  res.redirect('/products')
});


/* DELETE product */
router.delete('/delete/:id',function(req, res, next) {
  let id = req.params.id

  danhSachSP = danhSachSP.filter(pro => pro.id != id)

  res.send({res: true})
});



/* GET search result. */
router.get('/search/:value',function(req, res, next) {
  let {value} = req.params
  let result = danhSachSP.filter(sp => 
    sp.productName.toLowerCase().includes(value.toLowerCase())) || []
  res.send({result, loaiSP})
});



module.exports = router;
