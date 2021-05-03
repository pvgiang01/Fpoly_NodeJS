var express = require('express');
var router = express.Router();

var danhSachSP = [
    {id: 1, productName: 'Nokia', price: 2000, published: '2020-05-20'},
    {id: 2, productName: 'Samsung', price: 3000, published: '2020-05-20'},
    {id: 3, productName: 'Apple', price: 4000, published: '2020-05-20'},
    {id: 4, productName: 'VSmart', price: 5000, published: '2020-05-20'},
    {id: 5, productName: 'Oppo', price: 6000, published: '2020-05-20'},
    {id: 6, productName: 'Xiaomi', price: 7000, published: '2020-05-20'},
    {id: 7, productName: 'Realme', price: 8000, published: '2020-05-20'},
    {id: 8, productName: 'Huawei', price: 9000, published: '2020-05-20'},
    {id: 9, productName: 'BPhone', price: 1000, published: '2020-05-20'},
    {id: 10, productName: 'Vertu', price: 11000, published: '2020-05-20'}
]
  

/* GET index page. */
router.get('/', function(req, res, next) {  
  res.send({danhSachSP})
});


/* GET login page. */
router.get('/:id', function(req, res, next) {
  let id = req.params.id
  let product = danhSachSP.find(sp => sp.id == id)
  res.send({product})
});




module.exports = router;
