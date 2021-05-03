

var userModel = require('../models/userModel')

exports.register = async function register(us) {
    let user = new userModel(us)
    return await user.save()
}

exports.login = async function login(username) {
    return await userModel.findOne({username: username}, 'username password')
}

exports.getById = async function getById(id) {
    return await userModel.findOne({_id: id}, 'username')
}