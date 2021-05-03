var express = require('express');
var router = express.Router();

var list = [
  {id: 1,name: 'PHP'},
  {id: 2,name: 'Ruby'},
  {id: 3,name: 'Java'},
  {id: 4,name: 'Python'},
  {id: 5,name: 'dotNet'},
  {id: 6,name: 'C#'},
  {id: 7,name: 'Swift'},
  {id: 8,name: 'Pascal'},
]

/* GET home page. */
router.get('/', function(req, res, next) {  
  res.send(list)
  // res.render('index', { title: 'Demo Ejs', list: list });
})

/* GET detail. */
router.get('/:id', function(req, res, next) {  
  let item = list.filter((v,i) => v.id == req.params.id)[0]
  console.log(item)
  res.render('detail', { title: 'Demo Ejs', item: item });
})

/**
 * Update product
 */
 router.post('/:id', (req, res) => {
  let id = req.params.id
  list = list.map((v,i)=> v.id == id ? {...v, name: req.body.name}: v)
  res.redirect('/')
});

/* GET add new. */
router.get('/new/new', function(req, res, next) {  
  res.render('addNew', { title: 'Demo Ejs'});
})

/**
 * add product
 */
 router.post('/', (req, res) => {
  list.push({id: 123, name: req.body.name})
  res.redirect('/')
});

module.exports = router;
