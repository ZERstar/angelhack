const express = require("express");
const router = express.Router();
const moment = require("moment");
const LoanApplications = require("../model/loanApplication");
const User = require("../model/user");
const Installments = require("../model/installments");
const industryData = {
  industries: [
    {
      name: "Technology",
      risk_percentage: 40,
    },
    {
      name: "Manufacturing",
      risk_percentage: 60,
    },
    {
      name: "Healthcare",
      risk_percentage: 50,
    },
    {
      name: "Retail",
      risk_percentage: 70,
    },
    {
      name: "Finance",
      risk_percentage: 45,
    },
  ],
};

//elegibility
// Dummy function to check SME eligibility (replace with actual logic)
function checkEligibility(smeData) {
  const response = { eligible: false, message: "" };

  if (!smeData) {
    response.message = "Invalid SME data";
    return response;
  }

  if (!smeData.financials) {
    response.message = "Financial data missing";
    return response;
  }

  const { financials, industry, banking_details, gst_details } = smeData;

  const creditScore = financials.credit_score || 0;
  if (creditScore < 600) {
    response.message = "Insufficient credit score";
    return response;
  }

  const debtToEquityRatio =
    financials.total_liabilities / financials.total_assets;
  if (debtToEquityRatio > 0.7) {
    response.message = "Excessive debt";
    return response;
  }

  const prohibitedIndustries = [
    "gambling",
    "illegal activities",
    "adult entertainment",
  ];
  if (prohibitedIndustries.includes(industry.toLowerCase())) {
    response.message = "Prohibited industry";
    return response;
  }

  if (!banking_details || !/^\d{9,18}$/.test(banking_details.account_number)) {
    response.message = "Invalid account number";
    return response;
  }

  if (
    !banking_details ||
    !/^[A-Z]{4}0[A-Z0-9]{6}$/.test(banking_details.ifsc_code)
  ) {
    response.message = "Invalid IFSC code";
    return response;
  }

  if (!gst_details || gst_details.net_tax_payable > 0) {
    response.message = "Non-compliance with GST regulations";
    return response;
  }

  response.eligible = true;
  response.message = "SME is eligible for a loan";
  return response;
}

// Endpoint to check SME eligibility
router.post("/check-eligibility/:id", async (req, res) => {
  const loan = await LoanApplications.findById(req.params.id);
  const user = await User.findById(loan.user);
  let smeData = {
    industry: user.industry,
    financials: user.financials,
    banking_details: user.banking_details,
    gst_details: user.gst_details,
  };

  // Check SME eligibility
  const isEligible = checkEligibility(smeData);
  loan.eligibility = isEligible;
  await loan.save();

  // Return eligibility result
  res.json({ isEligible });
});

// Endpoint to assess risk for SME
router.post("/assess-risk/:id", async (req, res) => {
  const loan = await LoanApplications.findById(req.params.id);
  const user = await User.findById(loan.user);
  let smeData = {
    industry: user.industry,
    financials: user.financials,
    credit_score: user.financials.credit_score,
    business_age: user.company_age,
    loan_amount: loan.loan_amount,
  };
  // Validate SME data
  if (!smeData) {
    return res.status(400).json({ error: "Invalid SME data" });
  }

  // Perform risk assessment (dummy logic)
  const riskPercentage = calculateRisk(smeData);

  // Return risk assessment result
  res.json({ risk_percentage: riskPercentage });
});

// Dummy function to calculate risk (replace with actual logic)
function calculateRisk(smeData) {
  // Example risk factors and weights (you can adjust these based on your criteria)
  const weights = {
    credit_score: 0.2,
    debt_to_equity_ratio: 0.2,
    business_age: 0.2,
    industry_risk: 0.2,
    loan_amount: 0.2,
  };

  let totalWeightedRisk = 0;

  // Credit score factor (higher score reduces risk)
  totalWeightedRisk += (1 - smeData.credit_score / 1000) * weights.credit_score;

  // Debt-to-equity ratio factor (lower ratio reduces risk)
  const debtToEquityRatio =
    smeData.financials.total_liabilities / smeData.financials.total_assets;
  // console.log(totalWeightedRisk)

  totalWeightedRisk += (0.5 + debtToEquityRatio) * weights.debt_to_equity_ratio;

  // Business age factor (longer operation reduces risk)
  totalWeightedRisk += (1 - smeData.business_age / 10) * weights.business_age;

  // Industry risk factor (higher risk increases risk)
  const industryRisk = industryData.industries.find(
    (industry) => industry.name === smeData.industry
  );
  if (industryRisk) {
    totalWeightedRisk +=
      (industryRisk.risk_percentage / 100) * weights.industry_risk;
  } else {
    // Default risk if industry is not found
    totalWeightedRisk += 0.4 * weights.industry_risk;
  }

  // Loan amount factor (higher amount increases risk)
  totalWeightedRisk += (smeData.loan_amount / 1000000) * weights.loan_amount;
  // Normalize risk percentage (0-100)
  const riskPercentage = Math.min(100, Math.max(0, totalWeightedRisk * 100));

  return riskPercentage;
}

// Route to create a new loan application

router.post("/new-loan", async (req, res) => {
  try {
    const { user_id, loan_amount, loan_purpose, interval } = req.body;

    const user = await User.findById(user_id);
    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    const loanApplication = new LoanApplications({
      user: user_id,
      loan_amount,
      loan_purpose,
      interval,
    });

    await loanApplication.save();

    // Generate installment entries based on the specified interval
    // const installments = [];
    // const installmentAmount = loan_amount / interval;
    // const startDate = moment().startOf('month');
    // for (let i = 0; i < interval; i++) {
    //     const dueDate = startDate.clone().add(i + 1, 'months').endOf('month');
    //     installments.push({
    //         user: user_id,
    //         loanApplication: loanApplication._id,
    //         amount: installmentAmount + (0.1 * loan_amount),
    //         due_date: dueDate.toDate(), // Convert moment object to JavaScript Date
    //         status: 'pending', // Initial status is pending
    //     });
    // }

    // // Insert installment entries into the database
    // await Installments.insertMany(installments);

    res.status(201).json(loanApplication);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Server error" });
  }
});

// router.post('/new-loan', async (req, res) => {
//     try {
//         const { user_id, loan_amount, loan_purpose, interval } = req.body;

//         const user = await User.findById(user_id);
//         if (!user) {
//         }

//         const loanApplication = new LoanApplications({
//             user: user_id,
//             loan_amount,
//             loan_purpose,
//             interval,

//         });

//         await loanApplication.save();

//         res.status(201).json(loanApplication);
//     } catch (error) {
//         console.error(error);
//         res.status(500).json({ error: 'Server error' });
//     }
// });
router.get("/", async (req, res) => {
  try {
    const loanApplications = await LoanApplications.find();
    res.status(200).json(loanApplications);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Server error" });
  }
});
// Route to get all loan applications for a specific user
router.get("/:user_id", async (req, res) => {
  try {
    const user_id = req.params.user_id;

    const loanApplications = await LoanApplications.find({ user: user_id });

    res.status(200).json(loanApplications);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Server error" });
  }
});

//update status of loanApplication
router.patch("/:loan_id", async (req, res) => {
  try {
    const loan_id = req.params.loan_id;
    const loan = await LoanApplications.findById(loan_id);
    const loan_amount = loan.loan_amount;
    const interval = loan.interval;
    const user = await User.findById(loan.user);

    const user_id = user._id;
    const { status } = req.body;

    if (status === "approved") {
      const installments = [];
      const installmentAmount = loan_amount / interval;
      const startDate = moment().startOf("month");
      for (let i = 0; i < interval; i++) {
        const dueDate = startDate
          .clone()
          .add(i + 1, "months")
          .endOf("month");
        installments.push({
          user: user_id,
          loanApplication: loan_id,
          amount: installmentAmount + 0.1 * loan_amount,
          due_date: dueDate.toDate(), // Convert moment object to JavaScript Date
          status: "pending", // Initial status is pending
        });
      }

      // Insert installment entries into the database
      await Installments.insertMany(installments);
    }

    const loanApplication = await LoanApplications.findOneAndUpdate(
      { _id: loan_id },
      { status: status },
      { new: true }
    );

    res.status(200).json(loanApplication);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Server error" });
  }
});

router.post("/loan-repay/:id", async (req, res) => {
  const instId = req.params.id;
  const installment = await Installments.findById(instId);
  const loanApp = await LoanApplications.findById(installment.loanApplication);
  loanApp.repayment_amount += installment.amount;
  await loanApp.save();
  await Installments.findByIdAndDelete(instId);
  res
    .status(200)
    .json({ message: "installment paid successful", success: true });
});
router.get("/installments/:id", async (req, res) => {
  const loanAppId = req.params.id;
  const installments = await Installments.find({ loanApplication: loanAppId });
  res.status(200).json(installments);
});

module.exports = router;
