const express = require('express');
const mongoose = require('mongoose');
const authrouter = require('./routers/auth')
const dns = require('dns');
dns.setServers([ '8.8.8.8', '8.8.4.4' ]);   

const app = express();
const port = 3000;
app.use(express.json());
app.use(authrouter);




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


