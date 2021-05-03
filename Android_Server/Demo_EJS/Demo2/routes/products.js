var express = require('express');
var router = express.Router();

const middle = require('../utilities/my_modules')

var danhSach = [
  {id: 1, name: 'Nokia', price:2000, availableAt: '2021-02-22'},
  {id: 2, name: 'Samsung', price:3000, availableAt: '2021-02-23'},
  {id: 3, name: 'Apple', price:4000, availableAt: '2021-02-24'},
  {id: 4, name: 'Oppo', price:1000, availableAt: '2021-02-25'},
  {id: 5, name: 'Nokia', price:2000, availableAt: '2021-02-22'},
  {id: 6, name: 'Samsung', price:3000, availableAt: '2021-02-23'},
  {id: 7, name: 'Apple', price:4000, availableAt: '2021-02-24'},
  {id: 8, name: 'Oppo', price:1000, availableAt: '2021-02-25'}
]


/* GET home page. */
router.get('/', middle.authenticateJWT, function(req, res, next) {
  res.render('index', { danhSach: danhSach });
});


/* GET new product page. */
router.get('/new', function(req, res, next) {
  res.render('new');
});


/**
 * add product
 */
router.post('/', (req, res) => {
  danhSach.push({id: 123, name: req.body.name, price: req.body.price, availableAt: req.body.availableAt})
  res.redirect('/')
});



/* GET edit product page. */
router.get('/edit/:id', function(req, res, next) {
  let id = req.params.id
  let item = danhSach.filter((v,i)=> v.id == id)[0]
  res.render('edit',{ item: item });
});

/**
 * edit product
 */
 router.post('/edit/:id', (req, res) => {
  let id = req.params.id
  danhSach = danhSach.map((v,i)=> v.id == id ? {...v, name: req.body.name, price: req.body.price, availableAt: req.body.availableAt}: v)
  res.redirect('/')
});


/**
 * delete product
 */
 router.delete('/delete/:id', (req, res) => {
  let id = req.params.id
  danhSach = danhSach.filter((v,i) => v.id != id)
  res.send({res: true})
});


module.exports = router;
