var userService = require('../services/users')

exports.register = async function register(username, password) {
    let user = {username, password}
    return await userService.register(user)
}

exports.login = async function login(username) {
    return await userService.login(username)
}

exports.getById = async function getById(id) {
    return await userService.getById(id)
}