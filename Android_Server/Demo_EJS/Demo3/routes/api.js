var express = require('express');
var router = express.Router();


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


/* GET products list. */
router.get('/products', function(req, res, next) {
  res.send({danhSach, loaiSP})
});


/* GET product detail  */
router.get('/products/:id', function(req, res, next) {
    let {id} = req.params
    let product = danhSach.find(sp => sp.id == id) || {}
    res.send({product})    
});

module.exports = router;
