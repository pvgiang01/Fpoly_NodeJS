var express = require("express");
var router = express.Router();
var studentController = require("../controllers/student");
var clazzController = require("../controllers/clazz");
const authenticate = require("../middle/authentication");
const upload = require('../middle/upload');


/* GET student list. */
router.get("/", [authenticate.checkLogin], function (req, res, next) {
  const students = studentController.get();
  const clazz = clazzController.get();
  res.render("students", { danhSach: students, clazz: clazz  });
});


/* GET one student. */
router.get("/edit/:id", [authenticate.checkLogin], function (req, res, next) {
  const {
    params: { id },
  } = req;
  const student = studentController.getOne(id);
  const clazz = clazzController.get();
  res.render("student", { student: student, clazz: clazz });
});


/* DELETE one student. */
router.delete("/delete/:id", [authenticate.checkLogin], function (req, res, next) {
    const {
      params: { id },
    } = req;
   studentController.delete(id)   
   res.json({result: true})
});


/* UPDATE one student. */
router.post("/update/:id", [authenticate.checkLogin, upload.single('avatar')], function (req, res, next) {
  let {params, body, file} = req  
  if (file) {
    let avatar = 'http://192.168.103.2:3000/images/' + file.originalname 
    body = { ...body, avatar }
  }
  studentController.update(params, body)
  res.redirect('/student')
});


/* INSERT one student. */
router.post("/insert", [authenticate.checkLogin], function (req, res, next) {
  let {body} = req
  studentController.insert(body)
  res.redirect('/student')
});

module.exports = router;
