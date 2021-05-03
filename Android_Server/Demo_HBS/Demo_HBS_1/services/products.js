
var Product = require('../models/product')
var helper = require('../commons/convertDate')

exports.getListProducts = async function getListProducts() {    
    let list = await Product.find().populate('idLoaiSP')
    // list = list.map(sp => {
    //     return {
    //       id: sp._id,
    //       productName: sp.productName,
    //       price: sp.price,
    //       published: helper.execute(sp.published),
    //       img: sp.img,
    //       loaiSP: {id: sp.idLoaiSP._id, name: sp.idLoaiSP.name}
    //     }
    // })
    return list
}

exports.addNew = async function addNewProduct(product) {
    const p = new Product(product)
    await p.save()
}

exports.getProductById = async function getProductById(id) {
    let sp = await Product.findById(id)
    let res = {
        id: sp._id,
        productName: sp.productName,
        price: sp.price,
        published: helper.execute(sp.published),
        idLoaiSP: sp.idLoaiSP,
        img: sp.img
    }
    return res || {}
}

exports.edit = async function editProduct(product) {
    let pro = await Product.findById(product.id)
    if (pro) {
        pro.productName = product.productName
        pro.price = product.price
        pro.published = product.published,
        pro.idLoaiSP = product.idLoaiSP
        if (product.img) {
            pro.img = product.img
        }  
        await pro.save()        
    }    
}

exports.remove = async function removeProduct(id) {
    await Product.remove({_id: id})
}

exports.search = async function search(keyWord) {
    let result = await Product.find({productName: { "$regex": keyWord, "$options": "i" }}).populate('idLoaiSP') || []
    result = result.map(sp => {
        return {
          id: sp._id,
          productName: sp.productName,
          price: sp.price,
          published: helper.execute(sp.published),
          img: sp.img,
          loaiSP: {id: sp.idLoaiSP._id, name: sp.idLoaiSP.name}
        }
    })
    return result
}