const express = require('express');
const router = express.Router();
const LoanApplications = require('../model/loanApplication');
const User = require('../model/user');


//elegibility
// Dummy function to check SME eligibility (replace with actual logic)
function checkEligibility(smeData) {
    const response = { eligible: false, message: '' };

    if (!smeData) {
        response.message = 'Invalid SME data';
        return response;
    }

    if (!smeData.financials) {
        response.message = 'Financial data missing';
        return response;
    }

    const {
        financials,
        industry,
        banking_details,
        gst_details
    } = smeData;

    const creditScore = financials.credit_score || 0;
    if (creditScore < 600) {
        response.message = 'Insufficient credit score';
        return response;
    }

    const debtToEquityRatio = financials.total_liabilities / financials.total_assets;
    if (debtToEquityRatio > 0.5) {
        response.message = 'Excessive debt';
        return response;
    }

    const prohibitedIndustries = ['gambling', 'illegal activities', 'adult entertainment'];
    if (prohibitedIndustries.includes(industry.toLowerCase())) {
        response.message = 'Prohibited industry';
        return response;
    }

    if (!banking_details || !/^\d{9,18}$/.test(banking_details.account_number)) {
        response.message = 'Invalid account number';
        return response;
    }

    if (!banking_details || !/^[A-Z]{4}0[A-Z0-9]{6}$/.test(banking_details.ifsc_code)) {
        response.message = 'Invalid IFSC code';
        return response;
    }

    if (!gst_details || gst_details.net_tax_payable > 0) {
        response.message = 'Non-compliance with GST regulations';
        return response;
    }

    response.eligible = true;
    response.message = 'SME is eligible for a loan';
    return response;
}


// Endpoint to check SME eligibility
router.post('/check-eligibility/:id', async (req, res) => {
    const loan = await LoanApplications.findById(req.params.id);
    const user = await User.findById(loan.user);
    let smeData = {
        industry: user.industry,
        financials: user.financials,
        banking_details: user.banking_details,
        gst_details: user.gst_details
    };


    // Check SME eligibility
    const isEligible = checkEligibility(smeData);
    loan.eligibility = isEligible
    await loan.save();

    // Return eligibility result
    res.json({ isEligible });
});





// Route to create a new loan application
router.post('/new-loan', async (req, res) => {
    try {
        const { user_id, loan_amount, loan_purpose } = req.body;


        const user = await User.findById(user_id);
        if (!user) {
        }

        const loanApplication = new LoanApplications({
            user: user_id,
            loan_amount,
            loan_purpose
        });

        await loanApplication.save();

        res.status(201).json(loanApplication);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Server error' });
    }
});

// Route to get all loan applications for a specific user
router.get('/:user_id', async (req, res) => {
    try {
        const user_id = req.params.user_id;

        const loanApplications = await LoanApplications.find({ user: user_id });

        res.status(200).json(loanApplications);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Server error' });
    }
});

//update status of loanApplication
router.patch('/:loan_id', async (req, res) => {
    try {

        const loan_id = req.params.loan_id;
        const { status } = req.body;

        const loanApplication = await LoanApplications.findOneAndUpdate({ _id: loan_id }, { status: status }, { new: true });

        res.status(200).json(loanApplication);

    }
    catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Server error' });
    }
})

module.exports = router;
