
var productService = require('../services/products')
var converDate = require('../commons/convertDate')

exports.getListProducts = async function getListProducts() {
    let sps = await productService.getListProducts()    
    return sps
}

exports.addNew = async function addNewProduct(params) {
    let { productName, price, published, idLoaiSP, img } = params
    let product = {        
        productName: productName,
        price: price,
        published: published,
        idLoaiSP: idLoaiSP,
        img: img
    }
    return await productService.addNew(product)
}

exports.getProductById = async function getProductById(params) {
    let { id } = params
    let product = await productService.getProductById(id)
    return product
}

exports.edit = async function editProduct(params, body) {
    let { id } = params
    let { productName, price, published, idLoaiSP, img } = body
    let product = {id, productName, price, published, idLoaiSP, img}
    return await productService.edit(product)
}

exports.remove = async function removeProduct(params) {
    let { id } = params
    return await productService.remove(id)
}

exports.search = function search(keyword) {
    return productService.search(keyword)
}
