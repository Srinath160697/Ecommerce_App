const moongoose = require('mongoose');

const subcategorySchema = new moongoose.Schema({
    categoryId:{
        type: String,
        required: true
    },
    categoryName:{
        type: String,
        required: true
    },
    image:{
        type: String,
        required: true,
    },
    subCategoryName:{
        type: String,
        required: true,
    }
});

const Subcategory = moongoose.model('subcategory', subcategorySchema);

module.exports = Subcategory;