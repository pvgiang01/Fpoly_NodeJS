var express = require('express');
var router = express.Router();
var jwt = require('jsonwebtoken')
var auth = require('../utilities/authen')


var users = [
  {id: 1, username: '1', password: '1'},
  {id: 2, username: '2', password: '2'}
]


/* GET home page. */
router.get('/', auth.authenticate, function(req, res, next) {
  // kiem tra login
  // neu chua login >>> chay login
  // da login >>> products
  res.redirect('/products')
});


/* GET login page. */
router.get('/login', function(req, res, next) {
  res.render('login')
});

/* POST login page. */
router.post('/login', function(req, res, next) {
  let {username, password} = req.body
  let user = users.find(us => us.username == username && us.password == password)
  if (user) {
    var token = jwt.sign({ user }, process.env.JWT_KEY);
    req.session.token = token
    res.redirect('/products')
  } else {
    res.redirect('/login')
  }
});

/* GET logout  */
router.get('/logout', function(req, res, next) {
  req.session.destroy(function(err) {
    res.redirect('/login')
  }) 
});



module.exports = router;
