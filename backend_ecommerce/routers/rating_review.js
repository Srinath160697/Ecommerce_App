const express = require('express');
const RatingReview = require("../models/rating_review");

const ratingReviewRouter = express.Router();

ratingReviewRouter.post('/api/rating-review', async(req,res)=>{
    try {
        const {buyerId,email,fullName,productId,rating,review} = req.body;
        const ratingReview = new RatingReview({buyerId,email,fullName,productId,rating,review});
        await ratingReview.save();
        res.status(201).json(ratingReview);
    } catch (e) {
        res.status(400).json({error: e.message});
    }
});


ratingReviewRouter.get('/api/rating-review', async(req,res)=>{
    try {
        const ratingReviews = await RatingReview.find();
        res.status(200).json(ratingReviews);
    } catch (e) {
        res.status(500).json({error: e.message});
    }
});

module.exports = ratingReviewRouter;