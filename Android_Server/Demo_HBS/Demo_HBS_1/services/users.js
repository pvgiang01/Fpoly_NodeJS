var User = require('../models/user')

exports.register = async function register(username, password) {
    let u = new User({username, password})
    return await u.save()
}

exports.login = async function login(username) {
    return await User.findOne({username}, 'username password')    
}

exports.getUser = async function getUser(id){
    return await User.findOne({_id: id}, 'username')
}