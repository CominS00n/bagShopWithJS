var express = require('express');
var router = express.Router();
var mysql = require('../connect');




//  การสร้าง Dashboard คำนวณยอดขายต่อวัน
router.get('/dashboard', (req, res) => {
    const sql = `SELECT SUM(TotalPrice) AS TotalSales
    FROM orders
    WHERE DATE(OrderDate) = CURDATE() `; 
    mysql.query(sql, (err, result) => {
      if (err) {
        res.send(err);
      } else {
        res.render('dashboard', { products: result });
        console.log(`Result from query: `, result); 
      }
    });
  });
 
  
  module.exports = router;