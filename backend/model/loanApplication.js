const mongoose = require('mongoose');

// Define schema for loan applications
const loanApplicationSchema = new mongoose.Schema({
    user: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true
    },
    sme: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true
    },
    loan_amount: {
        type: Number,
        required: true
    },
    loan_purpose: {
        type: String,
        required: true
    },
    status: {
        type: String,
        enum: ['pending', 'approved', 'rejected'],
        default: 'pending'
    },
    created_at: {
        type: Date,
        default: Date.now
    }
});

// Create LoanApplications model
const LoanApplications = mongoose.model('LoanApplications', loanApplicationSchema);

module.exports = LoanApplications;
