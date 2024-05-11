const mongoose = require('mongoose');

// Define schema for Installment collection
const InstallmentSchema = new mongoose.Schema({
    loanApplication: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'LoanApplications',
        required: true
    },
    user: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true
    },
    amount: {
        type: Number,
        required: true
    },
    due_date: {
        type: Date,
        required: true
    },
    status: {
        type: String,
        enum: ['pending', 'paid'],
        default: 'pending'
    }
});

// Create Installment model
const Installment = mongoose.model('Installment', InstallmentSchema);

module.exports = Installment;
