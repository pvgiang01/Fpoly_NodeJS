
var productServices = require('../services/productServices')


exports.getListProducts = async function getListProducts() {
    return await productServices.getListProducts()
}

exports.getProductById = async function getProductById(id) {
    return await productServices.getProductById(id)
}

exports.addNew = async function addNewProduct(params) {
    let { name, price, available, idLoaiSP, img } = params
    let product = {
        productName: name,
        price: price,
        published: available,
        idLoaiSP: idLoaiSP,
        img: img
    }
    return await productServices.addNew(product)
}

exports.edit = async function editProduct(id, params) {
    let { productName, price, published, idLoaiSP, img } = params
    let product = {id, productName, price, published, idLoaiSP, img}
    await productServices.edit(product)
}

exports.remove = async function removeProductById(id) {
    await productServices.remove(id)
}


exports.getProductByIdSelectedFields = async function getProductByIdSelectedFields(id) {
    return productServices.getProductByIdSelectedFields(id)
}