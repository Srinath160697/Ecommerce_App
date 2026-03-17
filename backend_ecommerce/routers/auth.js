const express = require('express');
const User = require('../models/user');
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken');
const authRouter = express.Router();

authRouter.post('/api/signup', async (req, res) => {
    try {
        const { fullName, email, password } = req.body;
        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.status(400).json({ msg: 'Email already exists' });
        }else{
            const salt = await bcrypt.genSalt(10);
            const hashedPassword = await bcrypt.hash(password, salt);
            var user = new User({ fullName, email, password: hashedPassword });
            user = await user.save();
            res.json(user);
        }
        
    } catch (error) {
        res.status(500).json({ error: error.message });
    }   
});

authRouter.post('/api/signin', async (req, res) => {
    try {
       const { email, password } = req.body;
       const finduser = await User.findOne({ email });
       if (!finduser) {
        return res.status(400).json({ msg: 'User not found with this email' });
       }else{
        const isMatch = await bcrypt.compare(password, finduser.password);
        if (!isMatch) {
        return res.status(400).json({ msg: 'Invalid  password' });
       }else{
        const token = jwt.sign({id: finduser._id},"passwordkey");
        const { password, ...userwithoutpassword } = finduser._doc;
        res.json({ token, ...userwithoutpassword});
       }
       }    
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

module.exports = authRouter;