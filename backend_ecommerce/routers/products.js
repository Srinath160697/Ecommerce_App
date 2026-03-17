const express = require('express');
const Product = require('../models/product');

const productRouter = express.Router();


productRouter.post("/api/product", async (req, res) => {
    try {
        const { productName, productPrice, quantity, description, category, subCategory, images } = req.body;
        const product = new Product({productName, productPrice, quantity, description, category, subCategory, images});
        await product.save();
        res.status(201).json(product);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});


productRouter.get("/api/product", async (req, res) => {
    try {
        const products =await Product.find();
        res.status(200).json(products);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

module.exports = productRouter;