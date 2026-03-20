const express = require('express');
const mongoose = require('mongoose');
const authrouter = require('./routers/auth')
const bannerRouter = require('./routers/banner');
const categoryRouter = require('./routers/category');
const subcategoryRouter = require('./routers/subcategory');
const productRouter = require('./routers/products');
const ratingReviewRouter = require('./routers/rating_review');
const cors = require('cors');
const dns = require('dns');
dns.setServers([ '8.8.8.8', '8.8.4.4' ]);   

const app = express();
const port = 3000;
app.use(express.json());
app.use(cors());
app.use(authrouter);
app.use(bannerRouter);
app.use(categoryRouter);
app.use(subcategoryRouter);
app.use(productRouter);
app.use(ratingReviewRouter);





const DB = "mongodb+srv://srinath:6379993134@cluster0.mzq7lur.mongodb.net/?appName=Cluster0";

mongoose.connect(DB).then(() => {
  console.log("Connection successful");
}).catch((err) => {
  console.log(err);
});



app.get("/", (req, res) => {
  res.send("Server is running successfully 🚀");
});
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});


