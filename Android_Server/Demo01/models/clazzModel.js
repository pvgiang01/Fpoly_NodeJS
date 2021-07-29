const mongoose = require('mongoose');
const Schema = mongoose.Schema;
const ObjectId = Schema.ObjectId;

const clazzSchema = new Schema({
    id: {type: ObjectId},
    name: {type: String}
})

module.exports = mongoose.model('class', clazzSchema)