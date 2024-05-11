// model/loanRepayment.js

const mongoose = require('mongoose');

const loanRepaymentSchema = new mongoose.Schema({
    loan_id: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'LoanApplications'
    },
    user_id: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User'
    },
    repayment_amount: {
        type: Number,
        required: true,
    },
    repayment_date: {
        type: Date,
        default: new Date()
    },
    status: {
        type: String,
        enum: ['paid', 'late', 'pending'],
        default: 'pending'
    }
});

const LoanRepayments = mongoose.model('LoanRepayments', loanRepaymentSchema);

module.exports = LoanRepayments;
