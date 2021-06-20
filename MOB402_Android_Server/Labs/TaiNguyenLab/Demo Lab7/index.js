//Gọi EXPRESSJS
var express = require('express');
//Tạo app để cấu hình router,...
var app = express();
//Chạy lên local host với port 3000
app.listen(process.env.PORT || '3232');


//Gọi thư viện Mongoose
var db = require('mongoose');
var Schema = db.Schema;

//Kết nối đến mlab. Các bạn nhớ thêm tài khoản và mật khẩu lúc nãy tạo ở Users
db.connect('mongodb://baitapmongo:A123456789@ds115523.mlab.com:15523/baitap');
console.log('Kết nối MongoDB thành công');



var schema = new Schema({
		item: String,
});

var thucHien = db.model('baitap', schema);


	app.get('/:id/edit.html',function(req,res){
		thucHien.findOne({_id: req.params.id},function(err,data){
			if(err) throw err;
			res.render('edit',{LayDL: data});
		});
	})

//Thực hiện insert
var insert = thucHien({item: 'Đinh Nguyễn Cẩm Tú'}, function(err){
	if(err) throw err;
	console.log('Đã thêm thành công');
})
	
//Thực hiện Update
var edit = thucHien.update({_id: '5bb318a4a248690fd058717e'}, {item: 'Đinh Nguyễn Gia Bảo'}, function(err){
	if(err) throw err;
	console.log('Đã sửa thành công');
})
	
//Thực hiện xóa	
//id các bạn lấy ở phần Document
var xoa = thucHien.remove({_id: '5bb318a4a248690fd058717e'},function(err){
	//Nếu bị lỗi sẽ bỏ qua
	if(err) throw err;
	//Nếu thành công sẽ thông báo
	console.log('Đã xóa thành công');
})






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


