

var jwt = require('jsonwebtoken')



exports.check = function(req, res, next){
    let {token} = req.session
    
    if (token) {
        jwt.verify(token, process.env.JWT_KEY, function(err, decoded) {
            if (err) {
                res.redirect('/login')
            } else {
                console.log('>>>', decoded)
                next()
            }
        });
    } else {
        res.redirect('/login')
    }
}

exports.verifyToken = function verifyToken(req, res, next) {
    // var token = req.headers['x-access-token'];
    var authorization = req.header('Authorization')
    if (!authorization)
        return res.status(500).send({ auth: false, message: 'Failed to authenticate token.' });
    var token = authorization.split(' ')[1];
    if (!token)
        return res.status(403).send({ auth: false, message: 'No token provided.' });

    jwt.verify(token, process.env.JWT_KEY, function (err, decoded) {
        if (err)
            return res.status(500).send({ auth: false, message: 'Failed to authenticate token.' });

        // if everything good, save to request for use in other routes
        req.userId = decoded.id;
        next();
    });
}

