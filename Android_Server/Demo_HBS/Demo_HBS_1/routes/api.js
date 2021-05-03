var express = require('express');
var router = express.Router();
var jwt = require('jsonwebtoken')
var bcrypt = require('bcryptjs')
var productController = require('../controllers/products')
var userController = require('../controllers/user')
var middle = require('../commons/authenticate')

var tokenList = {};


/* GET index page. */
router.get('/products', async function(req, res, next) {  
  const products = await productController.getListProducts()
  res.json(products)
});


/* GET login page. */
router.get('/product/:id', function(req, res, next) {
  let id = req.params.id
  let product = productController.getProductById(id)
  res.json(product)
});


/* POST login page. */
router.post('/login', async function(req, res, next) {
  let {username, password} = req.body
  let user = await userController.login(username) 
  if(!user) res.status(401).json({ auth: false, token: null }); 

  var passwordIsValid = bcrypt.compareSync(password, user.password);
  if (!passwordIsValid) return res.status(401).json({ auth: false, token: null });

  let token = jwt.sign({ id: user._id, username: user.username },
                 process.env.JWT_KEY,  {  expiresIn: 3600 }); 
  let refreshToken = jwt.sign({ id: user._id, username: user.username },
                process.env.JWT_REFRESH_KEY,  {  expiresIn: 86400*30 });   
  tokenList.refreshToken = {token, refreshToken}   
  res.status(200).json({ token, refreshToken }); 
});


router.post('/register', async function(req, res) {
  let {username, password} = req.body
  var hashedPassword = bcrypt.hashSync(password, 8);
  let user = await userController.register(username, hashedPassword)
  var token = jwt.sign({ id: user._id }, process.env.JWT_KEY, {expiresIn: JWT_KEY_LIFETIME });
  res.status(200).json({ auth: true, token: token }); 
});

router.get('/me', middle.verifyToken, async function(req, res) {
  const {userId} = req  
  const user = await userController.getUser(userId)
  res.status(200).json(user);
});




module.exports = router;
