const moongoose = require('mongoose');

const categorySchema = new moongoose.Schema({
    name:{
        type: String,
        required: true
    },
    image:{
        type: String,
        required: true,
    },
    banner:{
        type: String,
        required: true,
    }
});

const Category = moongoose.model('category', categorySchema);

module.exports = Category;