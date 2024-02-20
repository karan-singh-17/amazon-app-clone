const express = require('express');
const adminRouter = express.Router();
const admin = require('../middlewares/admin');
const { Product } = require('../models/product');
const Order = require('../models/order');

adminRouter.post('/admin/add-product' , admin , async (req , res) =>{
    try {
        const {name , description , images , quantity , price , category} = req.body;
        let product = Product({
            name , description , images , quantity , price , category
        }
        );
        product = await product.save();
        res.json(product);
    } catch (e) {
        res.status(500).json({error : e.message});
    }
});

adminRouter.get('/admin/get-product' , admin , async (req , res) => {
    try {
        const products = await Product.find({});
        res.json(products);
        
    } catch (e) {
        res.status(500).json({ error : e.message});        
    }
});

adminRouter.get('/admin/all-orders' , admin , async (req , res) => {
    try {
        const orders = await Order.find({});
        res.json(orders);
    } catch (e) {
        res.status(500).json({ error : e.message});        
    }
});

adminRouter.post("/admin/change-order-status", admin, async (req, res) => {
    try {
      const { id, status } = req.body;
      let order = await Order.findById(id);
      order.status = status;
      order = await order.save();
      res.json(order);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
module.exports = adminRouter;