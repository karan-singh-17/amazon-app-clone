const express = require('express');
const { Product } = require('../models/product');
const ProductRouter = express.Router();

ProductRouter.get('/api/products' , async (req , res) => {
    try {
        const products = await Product.find({category : req.query.category});
        res.json(products);
    } catch (e) {
        res.status(500).json({ error : e.message});        
    }
});

ProductRouter.get('/api/products/search' , async (req , res) => {
    try {
        const products = await Product.find({
            name : { $regex: req.query.search}})
        res.json(products);
    } catch (e) {
        res.status(500).json({error : e.message});
    }
});

module.exports = ProductRouter;