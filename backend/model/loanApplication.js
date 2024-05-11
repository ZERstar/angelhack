const mongoose = require('mongoose');

// Define schema for loan applications
const loanApplicationSchema = new mongoose.Schema({
    user: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true
    },
    // sme: {
    //     type: mongoose.Schema.Types.ObjectId,
    //     ref: 'User',
    //     required: true
    // },
    loan_amount: {
        type: Number,
        required: true
    },
    loan_purpose: {
        type: String,
        required: true
    },
    repayment_amount: {
        type: Number,
        required: true,
        default: 0
    },
    interval: {
        type: Number,
        required: true
    },
    interest: {
        type: Number,
        required: true,
        default: 0.01
    },
    status: {
        type: String,
        enum: ['step1', 'step2', 'step3', 'step4', 'approved', 'rejected'],
        default: 'step1'
    },
    eligibility: {
        eligible: { type: Boolean, default: false },
        message: { type: String }
    },

    created_at: {
        type: Date,
        default: Date.now
    }
});

// Create LoanApplications model
const LoanApplications = mongoose.model('LoanApplications', loanApplicationSchema);

module.exports = LoanApplications;
