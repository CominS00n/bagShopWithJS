var express = require('express');
var router = express.Router();
var mysql = require('../connect');


// แสดงข้อมูลตาราง (show table)
router.get('/productForm', (req, res) => {
  var sql = 'SELECT * FROM product';
  mysql.query(sql, (err, result) => {
    if (err) {
      res.send(err);
    } else {
      res.render('productForm', { items: result });
    }
  })
});

// แสดงข้อมูลตาราง (Product customer)
router.get('/productCustomer', (req, res) => {
  var sql = 'SELECT * FROM product';
  mysql.query(sql, (err, result) => {
    if (err) {
      res.send(err);
    } else {
      res.render('productCustomer', { items: result });
    }
  })
});

//เพิ่มรายการสินค้า  (insert table)   
router.post('/insertForm',(req, res)=>{
  var sql = 'INSERT INTO product SET?';
  var data = req.body;
  mysql.query(sql,data,(err,result)=>{
    if(err){
      res.send(err);
  } else{
    res.redirect('admin/productForm');
  }
  })
});

// แก้ไขตารางสินค้า (update table)
router.get('/updateForm/:id', (req, res) => {
  var sql = 'SELECT * FROM product WHERE pd_ID=?';
  mysql.query(sql, req.params.id, (err, result) => {
    if (err) {
      res.send(err);
    } else {
      res.render('updateForm', {
        data: result[0]
      });
    }
  })
})

router.post('/updateForm/:id', (req, response) => {
  var sql = 'UPDATE product SET? WHERE pd_ID =?';
  var params = [req.body, req.params.id];
  mysql.query(sql, params, (err, result) => {
    if (err) {
      response.send(err);
    } else {
      response.redirect('/admin/productForm');
    }
    response.end();
  })
})

// ลบข้อมูลสินค้าในตาราง
router.get('/productForm/:id', (req, response) => {
  var sql = 'DELETE FROM product WHERE pd_ID = ?';
  var id = req.params.id;
  console.log(id);

  mysql.query(sql, id, (err, result) => {
    if (err) {
      response.send(err);
      console.log('OK');
    } else {
      console.log('OK');
      response.redirect('/admin/productForm');
    }
    response.end();
  });
});

// ค้นหาข้อมูลตารางรายการสินค้า (delate table)
router.get('/searchForm', (req, res) => {
  console.log(req);
  var pd_name = req.query.q;
  var sql = "SELECT * FROM product WHERE pd_name LIKE '%" + pd_name + "%'";
  mysql.query(sql, (err, result) => {

    if (err) {
      res.send(err);
    } else {

      res.render('searchForm', { items: result });
    }
  })
});


// ตารางค้นหาข้อมูล
router.get('/searchForm', (req, res) => {
  var sql = 'SELECT * FROM product';
  mysql.query(sql, (err, result) => {
    if (err) {
      res.send(err);
    } else {
      res.render('/admin/searchForm', { items: result });
    }
  })
});


// Add member
router.post('/memberForm', (req, res) => {
  var sql = 'INSERT INTO member SET?';
  var data = req.body;
  mysql.query(sql, data, (err, result) => {
    if (err) {
      res.send(err);
    } else {
      res.redirect('/'); //productForm
    }
  })
});

module.exports = router;