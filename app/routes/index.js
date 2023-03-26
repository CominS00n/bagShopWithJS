var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/productForm', function(req, res, next) {
  res.render('productForm', { title: 'productForm' });
});

router.get('/insertForm', function(req, res, next) {
  res.render('insertForm', { title: 'insertForm' });
});

router.get('/updateForm', function(req, res, next) {
  res.render('updateForm', { title: 'updateForm' });
});

router.get('/productCustomer', function(req, res, next) {
  res.render('productCustomer', { title: 'productCustomer' });
});

router.get('/memberForm', function(req, res, next) {
  res.render('memberForm', { title: 'memberForm' });
});

router.get('/loginAdmin', function(req, res, next) {
  res.render('loginAdmin', { title: 'loginAdmin' });
});

// router.get('/orders', function(req, res, next) {
//   res.render('orders', { title: 'orders' });
// });

module.exports = router;
