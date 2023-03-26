var connection = require('../connect');
var express = require('express');
var session = require('express-session');
var bodyParser = require('body-parser');
var path = require('path');
var router = express.Router();


var router = express();
router.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));


router.get('/index', function (request, response) {
	response.sendFile(path.join(__dirname + '/index.ejs'));
});

router.post('/auth', function (request, response) {
	var username = request.body.username;
	var password = request.body.password;
	if (username && password) {
		connection.query('SELECT * FROM admin WHERE username = ? AND password = ?', [username, password], function (error, results, fields) {
			if (results.length > 0) {
				request.session.loggedin = true;
				request.session.username = username;
				response.redirect('admin/productForm'); // ทดสอบ login เข้าหน้า homepage ที่ path /
			} else {
				response.send('Incorrect Username and/or Password!');
			}
			response.end();
		});
	} else {
		response.send('Please enter Username and Password!');
		response.end();
	}
});

router.get('/home', function (request, response) {
	if (request.session.loggedin) {
		response.send('Welcome back, ' + request.session.username + '!');
	} else {
		response.send('Please login to view this page!');
	}
	response.end();
});

module.exports = router;