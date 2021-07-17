var express = require('express')
var router = express.Router()
var studentController = require('../controllers/student')

/* GET student list. */
router.get('/', function(req, res, next) {
    const students = studentController.get()
    res.render('students', { danhSach: students });
});


module.exports = router;
