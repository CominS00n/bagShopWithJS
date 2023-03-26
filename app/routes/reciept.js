var express = require('express');
var router = express.Router();
var mysql = require('../connect');
const fs = require('fs');
const PDFDocument = require('pdfkit');


// ทำการออกใบเสร็จ
router.get('/receipt', function (req, res) {
  const orderID = req.query.orderid;
  console.log(`order ID: ${orderID}`);
  const query = `SELECT * 
    FROM orders
    RIGHT JOIN product ON orders.ProductID = product.pd_ID
    WHERE OrderID = ${orderID}`;

  mysql.query(query, (err, results, fields) => {
    if (err) {
      throw err;
    } else {
      const doc = new PDFDocument();
      res.setHeader('Content-Type', 'application/pdf');
      res.setHeader('Content-Disposition', `attachment; filename=receipt-${orderID}.pdf`);
      doc.pipe(res);

      // สร้างฟอร์มใบเสร็จ
      doc.fontSize(16).text(`Reciept ID: XXXXX${orderID}`, 100, 100);
      let yPos = 130;
      results.forEach((order, index) => {
        doc.fontSize(12).text(`CustomerName: ${order.CustomerName}`, 100, yPos);
        doc.text(`ProductName: ${order.pd_name}`, 100, yPos + 20);
        doc.text(`Quantity: ${order.Quantity}`, 100, yPos + 40);
        doc.text(`Price: ${order.pd_price}`, 100, yPos + 60);
        doc.text(`TotalPrice: ${order.TotalPrice}`, 400, yPos + 60);
        yPos += 80;
      });

      doc.end();
    }
  });
});

module.exports = router;
