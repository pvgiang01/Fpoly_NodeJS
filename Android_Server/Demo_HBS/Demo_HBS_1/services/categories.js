
var Category = require('../models/category')

exports.getListCategories = async function getListCategories() {
    let list = await Category.find()
    list = list.map(category => {
        return {
            id: category._id,
            name: category.name
        }
    })
    return list
}
