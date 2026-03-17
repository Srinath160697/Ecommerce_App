const express = require('express');
const SubCategory = require("../models/subcategory");

const subcategoryRouter = express.Router();

subcategoryRouter.post('/api/subcategory', async(req,res)=>{
    try {
        const {categoryId,categoryName,image,subCategoryName} = req.body;
        const subcategory = new SubCategory({categoryId,categoryName,image,subCategoryName});
        await subcategory.save();
        res.status(201).send(subcategory);
        
    } catch (e) {
        res.status(500).send({error: e.message});
    }
});


subcategoryRouter.get('/api/category/:categoryName/subcategory', async(req,res)=>{
    try {
        const {categoryName} = req.params;
        const subcategories = await SubCategory.find({categoryName: categoryName});
        if(!subcategories || subcategories.length == 0){
            return res.status(404).json({msg: "No subcategories found for the given category"});
        }else{
            res.status(200).json(subcategories);
        }
    } catch (e) {
        res.status(500).json({error: e.message});
    }
});

module.exports = subcategoryRouter;