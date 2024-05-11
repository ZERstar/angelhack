// routes/loanRepayment.js

const express = require('express');
const router = express.Router();
const LoanApplications = require('../model/loanApplication');
const LoanRepayment = require('../model/loanRepayment');
const User = require('../model/user');


// router.get('/:user_id', async (req, res) => {
//     try {
//         const { user_id } = req.params;
//         const loans = await LoanApplications.find({ user: user_id });
//         res.json(loans);
//     } catch (error) {
//         console.error(error);
//         res.status(500).json({ error: 'Server error' });
//     }
// });

// Endpoint to record loan repayment
router.post('/record-repayment/:loan_id', async (req, res) => {
    try {
        const { loan_id } = req.params;
        const { repayment_amount } = req.body;
        const loanApp = await LoanApplications.findById(loan_id);
        const user = await User.findById(loanApp.user);
        // Create a new loan repayment record
        const loanRepayment = new LoanRepayment({
            loan_id,
            user_id: user._id,
            repayment_amount,
            repayment_date: new Date(),
            status: 'paid'
        });
        await loanRepayment.save();
        console.log(repayment_amount)
        // Update loan application with repayment details
        loanApp.repayment_amount += repayment_amount
        await loanApp.save();
        // Save the repayment record


        // if (!loan.paid_amount) {
        //     loan.paid_amount = 0;
        // }
        // if (!loan.remaining_amount) {
        //     loan.remaining_amount = 0;
        // }

        // loan.paid_amount += repayment_amount;
        // loan.remaining_amount = loan.loan_amount - repayment_amount;

        // await loan.save();

        res.status(201).json({
            loanApp
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Server error' });
    }
});

// Endpoint to retrieve repayment history for a specific loan
router.get('/repayment-history/:loan_id', async (req, res) => {
    try {
        const { loan_id } = req.params;

        const repaymentHistory = await LoanRepayment.find({ loan_id });
        const loan = await LoanApplications.findById(loan_id);

        res.status(200).json({
            repaymentHistory,
            loan: {
                total_amount: loan.total_amount,
                paid_amount: loan.paid_amount || 0,
                remaining_amount: loan.remaining_amount || 0
            }
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Server error' });
    }
});

// Function to calculate late payment due charges
function calculateLatePaymentCharges(overdueAmount, interestRate) {
    // Calculate late payment due charges
    const latePaymentCharges = overdueAmount * (interestRate / 100);
    return latePaymentCharges;
}

module.exports = router;
