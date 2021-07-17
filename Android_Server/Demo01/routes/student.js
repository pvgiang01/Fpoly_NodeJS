var express = require("express");
var router = express.Router();
var studentController = require("../controllers/student");
const authenticate = require("../middle/authentication");

/* GET student list. */
router.get("/", [authenticate.checkLogin], function (req, res, next) {
  const students = studentController.get();
  res.render("students", { danhSach: students });
});

/* GET one student. */
router.get("/edit/:id", [authenticate.checkLogin], function (req, res, next) {
  const {
    params: { id },
  } = req;
  const student = studentController.getOne(id);
  res.render("student", { student: student });
});


/* DELETE one student. */
router.delete("/delete/:id", [authenticate.checkLogin], function (req, res, next) {
    const {
      params: { id },
    } = req;
   studentController.delete(id)   
   res.json({result: true})
});



module.exports = router;
