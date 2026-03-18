const moongoose = require('mongoose');

const ratingreviewSchema = new moongoose.Schema({
   
    buyerId:{
        type: String,
        required: true,
    },
    email:{
        type: String,
        required: true,
    },
    fullName:{
        type: String,
        required: true,
    },
    productId:{
        type: String,
        required: true,
    },
    
    rating:{
        type: Number,
        required: true,
    },
    review:{
        type: String,
        required: true,
    },
});

const RatingReview = moongoose.model('ratingreview', ratingreviewSchema);

module.exports = RatingReview;