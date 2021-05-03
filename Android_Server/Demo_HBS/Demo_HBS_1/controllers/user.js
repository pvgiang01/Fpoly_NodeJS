var userService = require('../services/users')

exports.register = async function register(username, password) {
    return await userService.register(username, password)
}

exports.login = async function login(username, password) {
    return await userService.login(username, password)    
}

exports.getUser = async function getUser(id){
    return await userService.getUser(id)
}