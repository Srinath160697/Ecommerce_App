const moongoose = require('mongoose');

const productSchema = new moongoose.Schema({
    productName:{
        type: String,
        trim: true,
        required: true
    },
    productPrice:{
        type: Number,
        required: true,
    },
    quantity:{
        type: Number,
        required: true,
    },
    description:{
        type: String,
        required: true,
    },
    category:{
        type: String,
        required: true,
    },
    subCategory:{
        type: String,
        required: true,
    },
    images:[
        {
            type: String,
            required: true,
        }
    ],
    popular:{
        type: Boolean,
        default: true
    },
    recommended:{
        type: Boolean,
        default: false
    },
});

const Product = moongoose.model('product', productSchema);

module.exports = Product;