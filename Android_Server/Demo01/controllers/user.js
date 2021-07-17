const userService = require('../services/user')



exports.login = function login(username, password) {
    const user = userService.login(username)
    if (!user) {
        return false
    }
    if (user.password != password) {
        return false
    }
    return true
}