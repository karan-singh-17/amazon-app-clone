const express = require('express');

const authRouter = require("./routes/auth.js");
const mongoose = require('mongoose');
const adminRouter = require('./routes/admin.js');
const ProductRouter = require('./routes/products.js');
const userRouter = require('./routes/user.js');
const PORT = 3000;
const app = express();
const DB = <private-link>
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(ProductRouter);
app.use(userRouter);

mongoose.connect(DB).then(()=>{
       console.log('Connected to MongoDB')
}).catch((e) =>{
       console.log(e);
})


app.listen(PORT , "0.0.0.0" , ()=>{
       console.log(`CONNECTED AT PORT ${PORT}`);
})

