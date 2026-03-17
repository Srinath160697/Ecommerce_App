const moongse = require('mongoose');

const bannerSchema = new moongse.Schema({
    image :{
        type: String,
        required: true
    }
});

const Banner = moongse.model('Banner', bannerSchema);

module.exports = Banner;