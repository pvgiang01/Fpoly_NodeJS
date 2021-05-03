
var categoryServices = require('../services/categories')

exports.getListCategories = async function getListCategories() {
    return await categoryServices.getListCategories()
}
