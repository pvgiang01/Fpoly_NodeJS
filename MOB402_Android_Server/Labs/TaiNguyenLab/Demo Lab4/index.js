//Gọi EXPRESSJS
var express = require('express');
//Tạo app để cấu hình router,...
var app = express();
//Chạy lên local host với port 3000
app.listen(process.env.PORT || '3000');

//Cấu hình handlebars
var expressHbs = require('express-handlebars');
app.engine('.hbs',expressHbs());
//Lưu Template vào folder "views"
app.set('view engine', '.hbs');



app.get('/', function(req, res){
	res.send('Hello world');
});

//Đưa layout vào đây
app.get('/baitap', function(req, res){
	//Nãy mình tạo index.hbs trong thư mục views rồi
	//Chỉ cần gọi tên nó ra thôi
	res.render('index');
})


