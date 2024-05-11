const express = require('express');
const router = express.Router();
const User = require('../models/user');

// Create a new user
router.post('/users', async (req, res) => {
    try {
        const newUser = await User.create(req.body);
        res.status(201).json(newUser);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
});

// Get all users
router.get('/users', async (req, res) => {
    try {
        const users = await User.find();
        res.json(users);
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
});

// Get a single user by ID
router.get('/users/:id', getUser, (req, res) => {
    res.json(res.user);
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



// Update a user by ID
router.patch('/users/:id', getUser, async (req, res) => {
    try {
        if (req.body.username != null) {
            res.user.username = req.body.username;
        }
        if (req.body.email != null) {
            res.user.email = req.body.email;
        }
        if (req.body.password != null) {
            res.user.password = req.body.password;
        }
        if (req.body.role != null) {
            res.user.role = req.body.role;
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
        res.json(updatedUser);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
});



// Delete a user by ID
router.delete('/users/:id', getUser, async (req, res) => {
    try {
        await res.user.remove();
        res.json({ message: 'User deleted' });
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
});

