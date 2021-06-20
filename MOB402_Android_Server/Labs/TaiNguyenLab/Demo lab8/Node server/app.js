var express = require("express");
var app = express();
var server = require("http").createServer(app);
var io = require("socket.io").listen(server);
var fs = require("fs");
server.listen(process.env.PORT || 3434);

console.log('server is running now');

//Mở kết nối giữa Android và Server
io.sockets.on('connection', function (socket) {
	
  console.log("Có người kết nối");
  
});

