const express = require('express');
const app = express();


app.get('/hello', (req, res) => {
  res.send('Hello, World node js coding begins!');
});
module.exports = app;