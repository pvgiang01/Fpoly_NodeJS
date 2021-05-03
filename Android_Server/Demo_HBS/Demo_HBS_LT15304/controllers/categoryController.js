
var categoryServices = require('../services/categoryServices')

exports.getListCategories = async function getListCategories() {
    return await categoryServices.getListCategories()
}

