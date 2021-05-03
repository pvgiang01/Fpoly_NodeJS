var express = require('express');
var router = express.Router();
var jwt = require('jsonwebtoken')
var checkLogin = require('../commons/authenticate.js')
var userController = require('../controllers/userController')

const users = [
  {id: 1, username: '1', password: '1'},
  {id: 2, username: '2', password: '2'}
]

/* GET index page. */
router.get('/', checkLogin.check, function(req, res, next) {
  // nếu đã login >>> trang products  
  // nếu chưa login
  res.redirect('/products')
});


/* GET login page. */
router.get('/login', function(req, res, next) {
  // nếu đã login >>> trang products  
  // nếu chưa login
  res.render('login')
});


/* POST login page. */
router.post('/login', async function(req, res, next) {
  let {username, password} = req.body
  let user = await userController.login(username, password)
  if (user) {
    let token = jwt.sign({ user }, process.env.JWT_KEY);
    req.session.token = token
    res.redirect('/products')
  } else {
    res.redirect('/login')
  }
});

/* GET logout. */
router.get('/logout', function(req, res, next) {
  req.session.destroy(function(err) {
    res.redirect('/login')
  })  
});



module.exports = router;
