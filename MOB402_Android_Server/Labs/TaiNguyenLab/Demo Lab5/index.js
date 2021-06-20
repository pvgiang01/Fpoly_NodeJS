//Gọi EXPRESSJS
var express = require('express');
//Tạo app để cấu hình router,...
var app = express();
var multer = require('multer');


var storage = multer.diskStorage({
	//cb chính là kiểm tra file có thể lưu trữ hay không
	//cb được dùng để thay đổi đường dẫn, thay đổi tên file,...
	destination: function (req, file, cb) {
		//Chúng ta sẽ dưa file vào thư mục uploads
		cb(null, './uploads');
	},
	filename: function (req, file, cb) {
		//Chúng ta sẽ để nguyên tên file không thay đổi
		cb(null, file.originalname);
	}

})
//Kích thước file tối đa 1MB
var upload = multer({storage:storage, limits:{fileSize:1*1024*1024}});


app.get('/upload', function(req,res){
	res.render('upload');
})

//Upload.single("tên name trong trường field của các bạn");
var upload = upload.single('avatar');
app.post('/upload',function(req, res){
	upload(req, res, function(err){
		//Nếu Upload bị lỗi
		if(err instanceof multer.MulterError){
			 return res.send('Kích thước File lớn hơn 1MB');

		}
		//Khi thành công sẽ thông báo người dùng đồng thời in thông tin file
		else{
			console.log(req.file)
			return res.send('Thành công');
		}
	})	
})






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


