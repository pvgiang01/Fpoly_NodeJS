var express = require('express');
var jwt = require('jsonwebtoken');
var middleware = require('../utilities/authenticate')
var router = express.Router();

const users = [
  {
      username: '1',
      password: '1',
      role: 'admin'
  }, 
  {
      username: '2',
      password: '2',
      role: 'member'
  }
];


/* GET home page. */
router.get('/', middleware.authenticate, function(req, res, next) {
  res.redirect('/products');
});



/* GET login page. */
router.get('/login', function(req, res, next) {
  res.render('login');
});


router.post('/login', (req, res) => {
  const { username, password } = req.body;
  const user = users.find(u => { return u.username === username && u.password === password });
  if (user) {
      const accessToken = jwt.sign({ username: user.username,  role: user.role }, process.env.JWT_KEY);
      let sess = req.session;
      sess.accessToken = accessToken;
      res.redirect('/products');
      
  } else {
    res.redirect('/login');
  }
});



router.get('/logout', function(req, res){
  req.session.destroy(function(){
     console.log("user logged out.")
  });
  res.redirect('/login');
});





module.exports = router;
