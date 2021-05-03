var userServices = require('../services/userServices')

exports.login = async function login(username) {
    return await userServices.login(username)
}
