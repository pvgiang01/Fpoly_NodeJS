var express = require('express');
var router = express.Router();
var userController = require('../controllers/user')


/* GET index page. */
router.get('/', function (req, res, next) {
  res.render('index');
});


/* POST login page. */
router.post('/', function (req, res, next) {
  const { username, password } = req.body
  const check = userController.login(username, password)
  if (check) {
    res.redirect('/student')
  }
  else {
    res.redirect('/')
  }
})


module.exports = router;









