const jwt = require('jsonwebtoken');

exports.authenticateJWT = (req, res, next) => {
    const accessToken = req.session.accessToken;
    console.log('>>>>>>>>>211111', req.session)
    if (accessToken) {
        jwt.verify(accessToken, process.env.JWT_KEY, (err, user) => {
            if (err) {
                return res.sendStatus(403);
            }
            next();
        });
    } else {
        res.redirect('/login')
    }
  };