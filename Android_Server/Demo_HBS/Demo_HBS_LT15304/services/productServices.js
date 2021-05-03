
var ProductModel = require('../models/productModel')

exports.getListProducts = async function getListProducts() {
    let products = await ProductModel.find().populate('idLoaiSP')
    return products
}

exports.getProductById = async function getProductById(id) {
    let product = await ProductModel.findById(id)    
    return product
}

exports.addNew = async function addNewProduct(product) {
    let pro = new ProductModel(product)
    return await pro.save()
}

exports.edit = async function editProduct(product) {
    let pro = await ProductModel.findById(product.id)
    if (pro) {
        pro.productName = product.productName
        pro.price = product.price
        pro.published = product.published
        pro.idLoaiSP = product.idLoaiSP

        if (product.img) {
            pro.img = product.img
        }
        await pro.save()
    }
}

exports.remove = async function removeProductById(id) {
    await ProductModel.remove({_id: id})
}


exports.getProductByIdSelectedFields = async function getProductByIdSelectedFields(id) {
   return await ProductModel.find({_id: id}, 'productName price')
}
