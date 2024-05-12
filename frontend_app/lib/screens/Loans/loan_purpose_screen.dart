import 'package:flutter/material.dart';
import 'package:frontend_app/widgets/config_prod.dart';
import 'package:frontend_app/widgets/constants/colors.dart';
import 'package:frontend_app/widgets/constants/texts.dart';
import 'package:frontend_app/widgets/input_fields/textInputField.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class LoanPurposeScreen extends StatefulWidget {
  final String userId;
  const LoanPurposeScreen({super.key, required this.userId});

  @override
  State<LoanPurposeScreen> createState() => _LoanPurposeScreenState();
}

class _LoanPurposeScreenState extends State<LoanPurposeScreen> {
  String loanPurpose = '';
  String loanAmount = '';
  String loanInterval = '';

  TextEditingController loanPurposeController = TextEditingController();
  TextEditingController loanAmountController = TextEditingController();
  TextEditingController loanIntervalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String userId = widget.userId;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Loan Purpose',
          style: h1TextStyle.copyWith(color: textBlack),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Please describe the purpose of the loan:',
                  style: h2TextStyle.copyWith(color: textBlack),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: textInputField(
                      'Loan Purpose',
                      const Icon(Icons.edit_outlined),
                      loanPurposeController, (p0) {
                    loanPurpose = p0;
                  }),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.h),
                  child: Text(
                    'Please specify the amount for the loan:',
                    style: h2TextStyle.copyWith(color: textBlack),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: textInputField(
                      'Loan Amount',
                      const Icon(Icons.edit_outlined),
                      loanAmountController, (p0) {
                    loanAmount = p0;
                  }),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.h),
                  child: Text(
                    'Please specify the interval for repayment of the loan:',
                    style: h2TextStyle.copyWith(color: textBlack),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: textInputField(
                      'Loan Interval',
                      const Icon(Icons.edit_outlined),
                      loanIntervalController, (p0) {
                    loanInterval = p0;
                  }),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.h),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        const url = '${AppConfig.baseUrl}/loanapp/new-loan';
                        final response = await http.post(Uri.parse(url), body: {
                          'user_id': userId,
                          'loan_amount': loanAmount,
                          'loan_purpose': loanPurpose,
                          'interval': loanInterval
                        });

                        if (response.statusCode == 201) {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        } else {
                          print('Error: ${response.body}');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: bgColor1,
                        textStyle: TextStyle(color: textWhite),
                      ),
                      child: Text(
                        'Submit',
                        style: h2TextStyle.copyWith(color: textWhite),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
