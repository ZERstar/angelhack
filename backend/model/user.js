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
    phone: {
        type: String,
        required: true,
        unique: true
    },
    password: {
        type: String,
        required: true
    },
    company_name: {
        type: String,
        required: true
    },
    registration_number: {
        type: String,
        required: true,
        unique: true
    },
    company_age: {
        type: Number,
        required: true
    },
    industry: {
        type: String,
        required: true
    },
    financials: {
        annual_revenue: Number,
        annual_profit: Number,
        credit_score: Number,
        total_liabilities: Number,
        total_assets: Number
    },
    banking_details: {
        bank_name: String,
        account_number: String,
        ifsc_code: String,
        branch: String
    },
    gst_details: {
        gst_number: String,
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
