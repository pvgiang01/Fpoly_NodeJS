var express = require('express');
var router = express.Router();
var auth = require('../utilities/authen')


var danhSach = [
  {id:1, name: 'Nokia', price: 2000, available: '2020-03-13', idLoaiSP: 1},
  {id:2, name: 'Samsung', price: 3000, available: '2021-03-13', idLoaiSP: 1},
  {id:3, name: 'Oppo', price: 4000, available: '2022-03-13', idLoaiSP: 2},
  {id:4, name: 'Apple', price: 5000, available: '2023-03-13', idLoaiSP: 3},
  {id:5, name: 'Vinsmart', price: 6000, available: '2024-03-13', idLoaiSP: 1},
  {id:6, name: 'Asus', price: 7000, available: '2025-03-13', idLoaiSP: 4},
  {id:7, name: 'LG', price: 8000, available: '2026-03-13', idLoaiSP: 5},
  {id:8, name: 'Realme', price: 1000, available: '2027-03-13', idLoaiSP: 6}
]

var loaiSP = [
  {id: 1, name: 'Dien thoai'},
  {id: 2, name: 'May tinh bang'},
  {id: 3, name: 'May tinh xach tay'},
  {id: 4, name: 'May tinh ban'},
  {id: 5, name: 'Tai nghe'},
  {id: 6, name: 'Ban phim'}
]

/* GET home page. */
router.get('/', auth.authenticate, function(req, res, next) {
  res.render('index', { list: danhSach, loaiSP });
});


/* GET add new page. */
router.get('/add-product', auth.authenticate, function(req, res, next) {
  res.render('add-new', {loaiSP});
});

/* POST add new page. */
router.post('/add-product', auth.authenticate, function(req, res, next) {
  let {name, price, available, idLoaiSP} = req.body

  let sp = {
    id:1000, 
    name: name, 
    price: price, 
    available: available,
    idLoaiSP: idLoaiSP
  }
  
  danhSach.push(sp)

  res.redirect('/products')
});



/* GET edit page. */
router.get('/edit-product/:id', auth.authenticate, function(req, res, next) {
  let id = req.params.id
  let pro = danhSach.find(sp => sp.id == id)

  res.render('edit-product', {product : pro, loaiSP});
});

/* POST edit product. */
router.post('/edit-product/:id', auth.authenticate, function(req, res, next) {
  let id = req.params.id
  let {name, price, available} = req.body

  danhSach.forEach(pro => {
    if (pro.id == id) {
      pro.name = name
      pro.price = price
      pro.available = available
    }
  })

  res.redirect('/products')
});


/* DELETE product. */
router.delete('/delete/:id', auth.authenticate, function(req, res, next) {
  let id = req.params.id
  danhSach = danhSach.filter(pro => pro.id != id)
  res.send({res: true})
});



module.exports = router;
