var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
require('dotenv').config()
const session = require('express-session')
const mongoose = require('mongoose');
require('./models/userModel')



var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var studentRouter = require('./routes/student');






var app = express();
mongoose.connect(process.env.MONGODB, {useNewUrlParser: true, useUnifiedTopology: true})
.then(() => console.log('>>>>> DB connected!!!!!'))
.catch((err) => console.log('>>>>> DB error!!!!!', err))

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');
var hbs = require('hbs')
hbs.registerHelper('soSanh', function (a,b,t) {
  return a.toString() == b.toString()
})

hbs.registerHelper('formatDate', function(a,t){
  let date = new Date(a)
  let month = date.getMonth() + 1
  let year = date.getFullYear()
  month = month.toString().length == 1 ? '0' + month : month
  let day = date.getDate().toString().length == 1 ? '0' + date.getDate().toString(): date.getDate().toString()
  return day + '/' + month + '/' + year
})

hbs.registerHelper('getClazzName', function (clazzId,clazz,t) {
  return clazz.filter(item => item.id == clazzId)[0].name
})


app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(session({
  secret: process.env.JWT_SECRET_KEY,
  resave: true,
  saveUninitialized: true,
  cookie: {secure: false}
}))



// http://localhost:3000/  domain


app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/student', studentRouter);








// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;




// lab 2
// tạo 1 project expressjs, view hbs
// viết 2 pages:
// http://localhost:3000/canh-day/10/chieu-cao/5
// render page có diện tích tam giác
// http://localhost:3000/
// render page có giao diện bootstraps




// lab 3
// tạo 1 project expressjs, view hbs
// viết 3 page
// page 1: login
// page 2: hiển thị danh sách sản phẩm (mã, tên, giá, ngày sản xuất, hình ảnh, nhã hàng)
// page 3: hiển thị chi tiết 1 sản phẩm



// lab 4
// tạo 1 project expressjs, view hbs
// viết 3 page
// page 1: login
// page 2: hiển thị danh sách sản phẩm (mã, tên, giá, ngày sản xuất, hình ảnh, nhã hàng)
// page 3: hiển thị chi tiết 1 sản phẩm, có button update
// page 2: modal để thêm mới






