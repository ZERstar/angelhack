// routes/loanRepayment.js

const express = require('express');
const router = express.Router();
const LoanApplications = require('../model/loanApplication');
const LoanRepayment = require('../model/loanRepayment');


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
        const { user_id, repayment_amount, repayment_date } = req.body;

        // Create a new loan repayment record
        const loanRepayment = new LoanRepayment({
            loan_id,
            user_id,
            repayment_amount,
            repayment_date,
            status: 'paid'
        });

        // Save the repayment record
        await loanRepayment.save();

        // Update loan application with repayment details
        let loan = await LoanApplications.findById(loan_id);

        if (!loan.paid_amount) {
            loan.paid_amount = 0;
        }
        if (!loan.remaining_amount) {
            loan.remaining_amount = 0;
        }

        loan.paid_amount += repayment_amount;
        loan.remaining_amount = loan.loan_amount - repayment_amount;

        await loan.save();

        res.status(201).json({
            loanRepayment,
            loan: {
                total_amount: loan.loan_amount,
                paid_amount: loan.paid_amount,
                remaining_amount: loan.remaining_amount
            }
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
