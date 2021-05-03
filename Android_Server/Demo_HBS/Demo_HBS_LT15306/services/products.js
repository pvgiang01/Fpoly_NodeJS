var categoryService = require('./categories')
var productModel = require('../models/productModel')

var danhSachSP = [
    {id: 1, productName: 'Nokia', price: 2000, published: '2020-05-20', idLoaiSP: 1, img: 'http://localhost:3001/images/bien.jpg'},
    {id: 2, productName: 'Samsung', price: 3000, published: '2020-05-20', idLoaiSP: 2, img: 'http://localhost:3001/images/maybay.jpg'},
    {id: 3, productName: 'Apple', price: 4000, published: '2020-05-20', idLoaiSP: 3, img: 'http://localhost:3001/images/ngua.jpg'},
    {id: 4, productName: 'VSmart', price: 5000, published: '2020-05-20', idLoaiSP: 4, img: 'http://localhost:3001/images/bien.jpg'},
    {id: 5, productName: 'Oppo', price: 6000, published: '2020-05-20', idLoaiSP: 1, img: 'http://localhost:3001/images/xedap.jpg'},
    {id: 6, productName: 'Xiaomi', price: 7000, published: '2020-05-20', idLoaiSP: 3, img: 'http://localhost:3001/images/bien.jpg'},
    {id: 7, productName: 'Realme', price: 8000, published: '2020-05-20', idLoaiSP: 4, img: 'http://localhost:3001/images/bien.jpg'},
    {id: 8, productName: 'Huawei', price: 9000, published: '2020-05-20', idLoaiSP: 2, img: 'http://localhost:3001/images/maybay.jpg'},
    {id: 9, productName: 'BPhone', price: 1000, published: '2020-05-20', idLoaiSP: 1, img: 'http://localhost:3001/images/bien.jpg'},
    {id: 10, productName: 'Vertu', price: 11000, published: '2020-05-20', idLoaiSP: 1, img: 'http://localhost:3001/images/ngua.jpg'}
]


exports.getListProducts = async function getListProducts() {
    let products = await productModel.find().populate('idLoaiSP')
    return products
}

exports.addNew = async function addNewProduct(product) {
    const p = new productModel(product)
    return await p.save()
}

exports.getProductById = async function getProductById(id) {
    return await productModel.findById(id)
}

exports.edit = async function editProduct(product) {
    let pro = await productModel.findById(product.id)
    if (pro) {
        pro.productName = product.productName
        pro.price = product.price
        pro.published = product.published
        pro.idLoaiSP = product.idLoaiSP
        if (product.img) {
            pro.img = product.img
        }
        return await pro.save()
    }    
}

exports.remove = async function removeProduct(id) {
    return await productModel.remove({_id: id})
}

exports.search = async function search(keyWord) {
    return await productModel.find({productName: keyWord}, 'productName price')
}