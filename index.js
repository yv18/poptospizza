// <!-- -- Group 4
// -- Yashraj Kishorsinh Raj --8890305
// -- Krutikkumar Manishkumar patel --8890281
// -- Dhruv Raheshbhai Patel --8875613
// -- Rutvik italiya --8898924
//--  Gurkirat Singh -- 8901247 -->

const express = require("express");
const path = require("path");
const PDFDocument = require("pdfkit");
const fs = require("fs");
const connection = require('./module/db'); 

const app = express();
const port = 4000;

app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, "public")));
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");

const db = require("./module/db");
db.connect((err) => {
  if (err) {
    console.error("Error connecting to MySQL:", err);
    return;
  }
  console.log("MySQL server is Connected");
});

app.get("/customers", (req, res) => {
  const sql = "SELECT * FROM `Shoppers' Info`";

  connection.query(sql, (err, results) => {
    if (err) {
      console.error("Error executing query:", err);
      res.status(500).send("Error executing query");
      return;
    }
    res.json(results);
  });
});

app.get("/", async (req, res) => {
  try {
    db.query(
      "SELECT * FROM `pizza (ready to eat) menu`; SELECT * FROM `pizzas`; SELECT * FROM `toppings`; SELECT * FROM `sides`; SELECT * FROM `Shoppers' Info`",
      (err, results) => {
        if (err) {
          console.error("Error executing query:", err);
          res.status(500).send("Error executing query");
          return;
        }
        res.render("invoice", {
          readyToEatPizza: results[0],
          pizzas: results[1],
          toppings: results[2],
          sides: results[3],
          shoppers: results[4],
        });
      }
    );
  } catch (error) {
    console.error(error);
    res.status(500).send("Internal Server Error");
  }
});

function generateHr(doc, y) {
  doc.strokeColor("#aaaaaa").lineWidth(1).moveTo(50, y).lineTo(550, y).stroke();
}

function formatDate(date) {
  const day = date.getDate();
  const month = date.getMonth() + 1;
  const year = date.getFullYear();

  return year + "/" + month + "/" + day;
}

function formatCurrency(cents) {
  return "Rs. " + cents + '.00';
}


function generateTableRow(
  doc,
  y,
  item,
  lineTotal
) {
  doc
    .fontSize(10)
    .text(item, 50, y)
    .text(lineTotal, 0, y, { align: "right" });
}

function generateHr(doc, y) {
  doc.strokeColor("#aaaaaa").lineWidth(1).moveTo(50, y).lineTo(550, y).stroke();
}

app.get("/generate-invoice", async (req, res) => {
  try {
    const shopperName = req.query.shopperName;
    const shopperEmail = req.query.shopperEmail;
    const shopperAddress = req.query.shopperAddress;
    const shopperPhone = req.query.shopperPhone;
    const selectedItems = JSON.parse(req.query.selectedItems);

    const total = selectedItems.reduce(
      (acc, item) => acc + parseFloat(item.price),
      0
    );

    const doc = new PDFDocument();
    const filename = `invoice_${shopperName.replace(" ", "_")}.pdf`;
    res.setHeader("Content-Disposition", `attachment; filename="${filename}"`);
    doc.pipe(res);

    doc
      .image("logo.jpg", 50, 45, { width: 50 })
      .fillColor("#444444")
      .fontSize(20)
      .text("POPTOS", 110, 57)
      .fontSize(10)
      .text("POPTOS", 200, 50, { align: "right" })
      .text("Mota Bazaar,", 200, 65, { align: "right" })
      .text("V V Nagar, Anand", 200, 80, { align: "right" })
      .moveDown();

    doc.fillColor("#444444").fontSize(20).text("Invoice", 50, 160);

    generateHr(doc, 185);

    const customerInformationTop = 200;

    doc
      .fontSize(10)
      .font("Helvetica")
      .text("Invoice Date:", 50, customerInformationTop)
      .text(formatDate(new Date()), 150, customerInformationTop)
      .text("Total Amount:", 50, customerInformationTop + 15)
      .text(formatCurrency(total), 150, customerInformationTop + 15)
      .font("Helvetica-Bold")
      .text(shopperName, 300, customerInformationTop)
      .font("Helvetica")
      .text(shopperAddress, 300, customerInformationTop + 15)
      .font("Helvetica")
      .text(shopperEmail, 300, customerInformationTop + 30)
      .font("Helvetica")
      .text(shopperPhone, 300, customerInformationTop + 45)
      .moveDown();

    generateHr(doc, 265);

    let i;
    const invoiceTableTop = 330;

    doc.font("Helvetica-Bold");
    generateTableRow(
      doc,
      invoiceTableTop,
      "Item",
      "Total"
    );
    generateHr(doc, invoiceTableTop + 20);
    doc.font("Helvetica");

    for(i = 0; i < selectedItems.length; i++){
      const item = selectedItems[i];
      const position = invoiceTableTop + (i + 1) * 30;
      generateTableRow(
        doc,
        position,
        item.name,
        formatCurrency(item.price)
      );
      generateHr(doc, position + 20);
    }
    const subtotalPosition = invoiceTableTop + (i + 1) * 30;
    doc
    .fontSize(10)
    .font('Helvetica-Bold')
    .text("Subtotal", 50, subtotalPosition)
    .text(formatCurrency(total), 0, subtotalPosition, { align: "right" });

    doc.end();
  } catch (error) {
    console.error(error);
    res.status(500).send("Internal Server Error");
  }
});



app.get('/update', (req, res) => {
  res.render('update.ejs');
});




app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});


app.post('/addOrder', (req, res) => {
  const { shopperID, name, address, number, email } = req.body;
  const query = `INSERT INTO \`Shoppers' Info\` (\`Shopper ID\`, \`Name\`, \`Address\`, \`Phone Number\`, \`Email\`)
                 VALUES (?, ?, ?, ?, ?)`;
  
      connection.query(query, [shopperID, name, address, number, email], (err, result) => {
      if (err) {
          console.error(err);
          res.send('Error adding order');
      } else {
          console.log('Person is added successfully');
          res.send('Person is added successfully');
      }
  });
});


app.post('/NewPizza', (req, res) => {
  const { PizzaID, PizzaName, PizzaType, PizzaPrice } = req.body;
  const query = `INSERT INTO \`Pizza (Ready to eat) Menu\` (\`Pizza ID\`, \`Pizza Name\`, \`Pizza Type\`, \`R_Pizza_Price\`)
                 VALUES (?, ?, ?, ?)`;
  
      connection.query(query, [PizzaID, PizzaName, PizzaType, PizzaPrice], (err, result) => {
      if (err) {
          console.error(err);
          res.send('Error adding New Item');
      } else {
          console.log('Item added successfully');
          res.send('Item added successfully');
      }
  });
});


app.post('/deletePizza', (req, res) => {
  const { deleteOrderID } = req.body;
  const deleteQuery = 'DELETE FROM `Pizza (Ready to eat) Menu` WHERE `Pizza ID` = ?';

  connection.query(deleteQuery, [deleteOrderID], (err, result) => {
      if (err) {
          console.error(err);
          res.send('Error deleting Pizza');
      } else {
          console.log('Pizza deleted successfully');
          res.send('Pizza deleted successfully');
      }
  });
});



app.post('/UpdatePizza', (req, res) => {
  const { PizzaID, PizzaName, PizzaType, PizzaPrice } = req.body;
  const updateQuery = 'UPDATE `Pizza (Ready to eat) Menu` SET `Pizza Name` = ?, `Pizza Type` = ?, `R_Pizza_Price` = ? WHERE `Pizza ID` = ?';

  connection.query(updateQuery, [PizzaName, PizzaType, PizzaPrice, PizzaID], (err, result) => {
      if (err) {
          console.error(err);
          res.send('Error updating Pizza details');
      } else {
          console.log('Pizza details updated successfully');
          res.send('Pizza details updated successfully');
      }
  });
});



