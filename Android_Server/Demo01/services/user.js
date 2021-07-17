// module

const users = [
    {id: 1, username: 'admin', password: '123'},
    {id: 2, username: 'manager', password: '111'},   
]

// select id, username, passwordHash from users where username = ? 
exports.login = function login(username) {
    const user = users.filter(us => us.username == username)[0] || null
    return user
}