const jwt = require('jsonwebtoken');

exports.authenticate = (req, res, next) => {
    const accessToken = req.session.accessToken;
    if (accessToken) {
        jwt.verify(accessToken, process.env.JWT_KEY, (err, user) => {
            if (err) {
                res.redirect('/login')
            }
            next();
        });
    } else {
        res.redirect('/login')
    }
  };