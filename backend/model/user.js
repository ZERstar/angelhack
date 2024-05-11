const mongoose = require('mongoose');

// Define schema for user (including SME details)
const userSchema = new mongoose.Schema({
    username: {
        type: String,
        required: true,
        unique: true
    },
    email: {
        type: String,
        required: true,
        unique: true
    },
    password: {
        type: String,
        required: true
    },
    // role: {
    //     type: String,
    //     enum: ['admin', 'borrower', 'lender'],
    //     required: true
    // },
    company_name: {
        type: String,
        required: true
    },
    registration_number: {
        type: String,
        required: true,
        unique: true
    },
    industry: {
        type: String,
        required: true
    },
    address: {
        street: String,
        city: String,
        state: String,
        pincode: String
    },
    contact_person: {
        name: String,
        email: String,
        phone: String
    },
    financials: {
        annual_revenue: Number,
        annual_profit: Number,
        credit_score: Number,
    },
    banking_details: {
        bank_name: String,
        account_number: String,
        ifsc_code: String,
        branch: String
    },
    gst_details: {
        gst_number: String,
        total_sales: Number,
        total_purchases: Number,
        net_tax_payable: Number
    },
    gov_ids: {
        pan_card: String,
        aadhar_card: String
    },

    created_at: {
        type: Date,
        default: Date.now
    }
});

// Create User model
const User = mongoose.model('User', userSchema);

module.exports = User;
