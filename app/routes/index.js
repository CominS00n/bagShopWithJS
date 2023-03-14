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


// แสดงสินค้าที่ต้องการสั่งซื้อหนึ่งรายการตาม id product ที่เลือก
router.get('/orders', (req, res) => {
  const ID = req.query.ProductID; // รับ ID ของสินค้าที่กด Add to Cart
  console.log(`Product ID: ${ID}`); // แสดงค่า ID ใน console
  const sql = `SELECT * FROM product WHERE pd_ID = ${ID}`;
  mysql.query(sql, (err, result) => {
    if (err) {
      res.send(err);
    } else {
      res.render('orders', { productCustomer: result });
    }
  })
});


// ทำการบันทึกการสั่งซื้อโดยการบันทึกข้อมูลลงในตารางการสั่งซื้อ orders
router.post('/createOrder', (req, res) => {
  const { customerName, address, productID, quantity, orderDate, totalPrice,OrderID } = req.body;
  console.log(`Product order: ${OrderID}`);
  const sql = `
    INSERT INTO orders (CustomerName, Address, Quantity, OrderDate, TotalPrice, ProductID)
    SELECT '${customerName}', '${address}', '${quantity}', '${orderDate}', '${totalPrice}', '${productID}'
    FROM products
    WHERE ProductID = ?`;
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
 SELECT o.*, p.ProductName, p.ProductPrice,p.Image
 FROM orders o
 INNER JOIN products p ON o.ProductID = p.ProductID
 WHERE o.OrderID = ${orderID}`;
  mysql.query(sql,(err, result) => {
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
      res.render('success', { products: result }); // สิ้นสุดการทำรายการกลับไปหน้าแรก
    }
  });
});

module.exports = router;
