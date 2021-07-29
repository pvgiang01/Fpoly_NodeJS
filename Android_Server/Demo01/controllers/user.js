const userService = require('../services/user')



exports.login = async function login(username, password) {
    const user = await userService.login(username)
    if (!user) {
        return false
    }
    if (user.password != password) {
        return false
    }
    return true
}