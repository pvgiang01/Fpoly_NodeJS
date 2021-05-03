
var productService = require('../services/products')

exports.getListProducts = function getListProducts() {
    return productService.getListProducts()
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
    await productService.addNew(product)
}

exports.getProductById = async function getProductById(params) {
    let { id } = params
    return await productService.getProductById(id)
}

exports.edit = async function editProduct(params, body) {
    let { id } = params
    let { productName, price, published, idLoaiSP, img } = body
    let product = {id, productName, price, published, idLoaiSP, img}
    await productService.edit(product)
}

exports.remove = async function removeProduct(params) {
    let { id } = params
    await productService.remove(id)
}

exports.search = async function search(params) {
    let { value } = params
    return await productService.search(value)
}
