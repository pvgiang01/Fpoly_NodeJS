var mongoClient = require('mongodb').MongoClient;
var http = require('http');
var request = require('request');
var path = require('path');
// https://www.thanhlongdev.com/huong-dan-xay-dung-restful-crud-api-voi-nodejs-express-va-mongodb/

const url = 'mongodb://127.0.0.1:27017'
const dbName = 'test_db';
const express = require('express');
const port = 3002;
const bodyParser = require('body-parser');
const app = express();
const cal = require('./my_modules')

// Use Node.js body parsing middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname,'./public')));

app.get('/', function(req,res){
  res.sendFile(path.join(__dirname,'./public/index.html'));
});

app.post('/add', (req, response) => {
  console.log(req.body)
  const { a, b } = req.body;
  let kq = cal.tinhTong(a, b)
  // var user_id = req.param('id');
  // var token = req.param('token');
  // getData(response)
  response.send({ ketqua: kq });

});

// Start the server
const server = app.listen(port, (error) => {
  if (error) return console.log(`Error: ${error}`);

  console.log(`Server listening on port ${server.address().port}`);
});


const getData = (cb) => {
  mongoClient.connect(url, function (err, client) {
    //neu ket noi khong thanh cong thi in ra loi
    if (err) throw err;
    //neu thanh cong thi log ra thong bao
    console.log('Ket noi thanh cong');
    // console.log(client)

    const db = client.db(dbName);
    // db.createCollection('products', function (err, res) {
    //     //Neu co loi thi in ra
    //     if (err) throw err;
    //     console.log('Tao thanh cong collection');
    //     res.close();
    // });

    // insertDocuments(db, function() {
    //     client.close();
    // });

    // findDocuments(db, function() {
    //     client.close();
    // });


    // queryDocuments(db, function() {
    //     client.close();
    // });


    // updateDocument(db, function() {
    //     client.close();
    // });


    // joinCatePro(db, function(res){
    //   cb.send(res)
    //   client.close()            
    // })

    joinProCate(db, function (res) {
      cb.send(res)
      client.close();
    })

  });
}






const insertDocuments = function (db, callback) {
  // Get the documents collection
  const collection = db.collection('categories');
  // Insert some documents
  collection.insertMany([
    { _id: 1, name: "Quan" },
    { _id: 2, name: "Ao" }
  ], function (err, result) {
    console.log("Inserted 3 documents into the collection");
    callback(result);
  });
}



const findDocuments = function (db, callback) {
  // Get the documents collection
  const collection = db.collection('products');
  // Find some documents
  collection.find({}).toArray(function (err, docs) {
    console.log("Found the following records");
    console.log(docs)
    callback(docs);
  });
}


const queryDocuments = function (db, callback) {
  // Get the documents collection
  const collection = db.collection('products');
  // Find some documents
  collection.find({ 'a': 2 }).toArray(function (err, docs) {
    console.log("Found the following records");
    console.log(docs);
    callback(docs);
  });
}


const updateDocument = function (db, callback) {
  // Get the documents collection
  const collection = db.collection('products');
  // Update document where a is 2, set b equal to 1
  collection.updateOne({ a: 2 }
    , { $set: { b: 1 } }, function (err, result) {
      console.log("Updated the document with the field a equal to 2");
      callback(result);
    });
}



const removeDocument = function (db, callback) {
  // Get the documents collection
  const collection = db.collection('products');
  // Delete document where a is 3
  collection.deleteOne({ a: 3 }, function (err, result) {
    console.log("Removed the document with the field a equal to 3");
    callback(result);
  });
}




const joinCatePro = function (db, callback) {
  const collection = db.collection('products');
  // console.log(collection)
  collection.aggregate([
    {
      $lookup: {
        from: 'categories',
        localField: 'category_id',
        foreignField: '_id',
        as: 'category'
      }
    }
  ]).toArray(function (err, res) {
    if (err) throw err;
    console.log(JSON.stringify(res));
    callback()
  });
}


const joinProCate = function (db, callback) {
  const collection = db.collection('categories');
  // console.log(collection)
  collection.aggregate([
    {
      $lookup: {
        from: 'products',
        localField: '_id',
        foreignField: 'category_id',
        as: 'productList'
      }
    }
  ]).toArray(function (err, res) {
    if (err) throw err;
    // console.log(JSON.stringify(res));
    callback(res)
  });
}