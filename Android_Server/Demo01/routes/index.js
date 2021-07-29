const express = require("express");
const jwt = require("jsonwebtoken");
const router = express.Router();
const userController = require("../controllers/user");
const authenticate = require("../middle/authentication");

/*
  nếu chưa login => redirect /login
  nếu đã login => redirect /student
*/
router.get("/", [authenticate.checkLogin], function (req, res, next) {
  res.redirect("/student");
});

router.get("/login", function (req, res, next) {  
  res.render("index");
});


/*
  submit form login
*/
router.post("/", async function (req, res, next) {
  const { username, password } = req.body;
  const check = await userController.login(username, password);
  if (check) {
    const access_token = jwt.sign(
      { id: 1, username: "admin" },
      process.env.JWT_SECRET_KEY
    );
    req.session.access_token = access_token;
    res.redirect("/student");
  } else {
    res.redirect("/");
  }
});

/* 
  GET logout
*/
router.get("/logout", function (req, res, next) {  
  req.session.destroy(function (err) {
    res.redirect('/login')
  })
});


module.exports = router;
