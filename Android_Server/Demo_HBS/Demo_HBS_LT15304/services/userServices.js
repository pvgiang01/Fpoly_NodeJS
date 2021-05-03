var UserModel = require('../models/userModel')

exports.login = async function login(username) {
    return await UserModel
                    .findOne({username: username})    
}