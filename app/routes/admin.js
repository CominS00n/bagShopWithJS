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
router.post('/insertForm', (req, res) => {
  var sql = 'INSERT INTO product SET?';
  var data = req.body;
  mysql.query(sql, data, (err, result) => {
    if (err) {
      res.send(err);
    } else {
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

// แสดงสินค้าที่ต้องการสั่งซื้อหนึ่งรายการตาม id product ที่เลือก
router.get('/orders', (req, res) => {
  const ID = req.query.ProductID; // รับ ID ของสินค้าที่กด Add to Cart
  console.log(`Product ID: ${ID}`); // แสดงค่า ID ใน console
  const sql = `SELECT * FROM product WHERE pd_ID = ${ID}`;
  mysql.query(sql, (err, result) => {
    if (err) {
      res.send(err);
    } else {
      res.render('orders', { products: result });
    }
  })
});

// ทำการบันทึกการสั่งซื้อโดยการบันทึกข้อมูลลงในตารางการสั่งซื้อ orders
router.post('/createOrder', (req, res) => {
  const { customerName, address, productID, quantity, orderDate, totalPrice, OrderID } = req.body;
  console.log(`Product order: ${OrderID}`);
  const sql = `
    INSERT INTO orders (CustomerName, Address, Quantity, OrderDate, TotalPrice, ProductID)
    SELECT '${customerName}', '${address}', '${quantity}', '${orderDate}', '${totalPrice}', '${productID}'
    FROM product
    WHERE pd_ID = ?`;
  mysql.query(sql, [productID], (err, result) => {
    if (err) {
      res.status(500).send(err);
    } else {
      const orderID = result.insertId; // ดึงค่า OrderID ที่ได้รับจากการ insert ล่าสุด
      res.redirect(`/finishedOrders?orderID=${orderID}`);
    }
  });
});


// ทำรายการสั่งซื้อเรียบร้อยแสดงรายการที่สั่งโดยทำการ join ตารางการของ orders และ products
router.get('/finishedOrders', (req, res) => {
  const orderID = req.query.orderID; // Get productID from query parameter

  console.log(`Product ID: ${orderID}`);
  const sql = `
 SELECT o.*, p.pd_name, p.pd_ID, p.pd_price,p.pd_imageName
 FROM orders o
 INNER JOIN product p ON o.ProductID = p.pd_ID
 WHERE o.OrderID = ${orderID}`;
  mysql.query(sql, (err, result) => {
    if (err) {
      res.status(500).send(err);
    } else {
      res.render('finishedOrders', { products: result });

    }
  });
});

// ทำรายการดึงข้อมูลบางส่วนขึ้นมาแสดงเพื่อทำรายการจ่ายเงิน
router.get('/payment', (req, res) => {
  const order_ID = req.query.order_ID; // รับ ID ของสินค้าที่กด Add to Cart
  console.log(`order ID: ${order_ID}`); // แสดงค่า ID ใน console
  const sql = `SELECT * FROM orders WHERE OrderID = ${order_ID}`;
  mysql.query(sql, (err, result) => {
    if (err) {
      res.send(err);
    } else {
      res.render('payment', { products: result });
    }
  })
});

// เมื่อทำการจ่ายเงินเรียบร้อยแล้วให้ทำรายบันทึการจ่ายลงในตาราง payment
router.post('/paymentlist', (req, res) => {
  const { orderid, email, phone, slip } = req.body;
  console.log(`Order ID: ${orderid}`);
  const sql = `
    INSERT INTO payment (OrderID, MobilePhone, SlipPayment, Email)
    VALUES ('${orderid}', '${phone}', '${slip}', '${email}');
  `;
  mysql.query(sql, (err, result) => {
    if (err) {
      throw err;
    } else {
      res.render('success', { orderid }); // ส่งค่า orderid ไปที่หน้า success 
    }
  });
});



module.exports = router;