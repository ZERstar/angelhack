const express = require('express');
const router = express.Router();
const User = require('../model/user');
var bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
require('dotenv').config();

// Create a new user
router.post('/signup', async (req, res) => {
    try {
        // Check if the email or username already exists
        const existingUser = await User.findOne({ email: req.body.email });
        if (existingUser) {
            return res.status(400).json({ message: 'User with the provided email or username already exists.' });
        }

        // Hash the password
        const hashedPassword = await bcrypt.hash(req.body.password, 10);

        // Create a new user object with the hashed password
        const newUser = new User({
            username: req.body.username,
            email: req.body.email,
            password: hashedPassword,
            company_name: req.body.company_name,
            registration_number: req.body.registration_number,
            industry: req.body.industry,
            address: req.body.address,
            contact_person: req.body.contact_person,
            financials: req.body.financials,
            banking_details: req.body.banking_details,
            gov_ids: req.body.gov_ids,
            gst_details: req.body.gst_details,
            company_age: req.body.company_age
        });

        // Save the new user
        await newUser.save();

        res.status(201).json(newUser);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
});

//login user
router.post('/login', async (req, res) => {
    try {
        const user = await User.findOne({ email: req.body.email });
        if (!user) {
            return res.status(401).json({ message: 'Invalid email or password' });
        }


        const isPasswordValid = await bcrypt.compare(req.body.password, user.password);
        if (!isPasswordValid) {
            return res.status(401).json({ message: 'Invalid email or password' });
        }


        const token = jwt.sign({ userId: user._id }, process.env.JWT_SECRET);

        res.status(200).json({ message: "login successful", token: token });
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
});



// Get all users
router.get('/', async (req, res) => {
    try {
        const users = await User.find();
        res.status(200).json(users);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
});

// Middleware to get a single user by ID
async function getUser(req, res, next) {
    let user;
    try {
        user = await User.findById(req.params.id);
        if (user == null) {
            return res.status(404).json({ message: 'User not found' });
        }
    } catch (error) {
        return res.status(500).json({ message: error.message });
    }
    res.user = user;
    next();
}
// Get a single user by ID
router.get('/:id', getUser, (req, res) => {
    res.status(200).json(res.user);
});





// Update a user by ID
router.patch('/:id', getUser, async (req, res) => {
    try {
        if (req.body.company_age != null) {
            res.user.company_age = req.body.company_age;
        }
        if (req.body.password != null) {
            res.user.password = req.body.password;
        }
        if (req.body.company_name != null) {
            res.user.company_name = req.body.company_name;
        }
        if (req.body.registration_number != null) {
            res.user.registration_number = req.body.registration_number;
        }
        if (req.body.industry != null) {
            res.user.industry = req.body.industry;
        }
        if (req.body.address != null) {
            res.user.address = req.body.address;
        }
        if (req.body.contact_person != null) {
            res.user.contact_person = req.body.contact_person;
        }
        if (req.body.financials != null) {
            res.user.financials = req.body.financials;
        }
        if (req.body.banking_details != null) {
            res.user.banking_details = req.body.banking_details;
        }
        if (req.body.gst_details != null) {
            res.user.gst_details = req.body.gst_details;
        }
        const updatedUser = await res.user.save();
        res.json({ message: "User Updated Successfully", updatedUser });
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
});



// Delete a user by ID
router.delete('/:id', async (req, res) => {
    try {
        await User.findByIdAndDelete(req.params.id);
        res.json({ message: 'User deleted' });
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
});

module.exports = router;

