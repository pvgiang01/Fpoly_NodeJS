const mongoose = require('mongoose')
const Schema = mongoose.Schema
const ObjectId = Schema.ObjectId;

const categorySchema = new Schema({
    id: { type: ObjectId },
    name: { type: String, alias: 'ppoiuoiuoi' },
    products: [{ type: Schema.Types.ObjectId, ref: 'Product' }]
})

module.exports = mongoose.model('Category', categorySchema)