const mongoose = require('mongoose');
const Schema = mongoose.Schema;
const ObjectId = Schema.ObjectId;

const studentSchema = new Schema({
    id: {type: ObjectId},
    name: {type: String},
    mobile: {type : String},
    classId: {type : Schema.Types.ObjectId, ref: 'class'},
    dob: {type : Date},
    avatar: {type : String},
    address: {type : String},
})

module.exports = mongoose.model('student', studentSchema)
