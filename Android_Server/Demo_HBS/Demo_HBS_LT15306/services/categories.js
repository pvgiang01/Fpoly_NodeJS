var categoryModel = require('../models/categoryModel')

exports.getListCategories = async function getListCategories() {
    return await categoryModel.find()
}
