import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend_app/screens/home_screen.dart';
import 'package:frontend_app/widgets/config_prod.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/constants/colors.dart';
import '../../widgets/constants/texts.dart';
import '../../widgets/input_fields/textInputField.dart';
import '../../widgets/mainButton.dart';

import 'package:http/http.dart' as http;

class KYCDetailScreen extends StatefulWidget {
  final String fullname;
  final String number;
  final String email;
  final String password;
  final String confirmPassword;
  final String companyName;
  final String regNo;
  final String companyAge;
  final String industry;
  final String gstNo;

  const KYCDetailScreen({
    Key? key,
    required this.fullname,
    required this.number,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.companyName,
    required this.regNo,
    required this.companyAge,
    required this.industry,
    required this.gstNo,
  }) : super(key: key);

  @override
  State<KYCDetailScreen> createState() => _KYCDetailScreenState();
}

class _KYCDetailScreenState extends State<KYCDetailScreen> {
  String aadharNumber = '';
  String panNumber = '';
  TextEditingController aadharController = TextEditingController();
  TextEditingController panController = TextEditingController();

  bool assuranceCheck1 = false;
  bool assuranceCheck2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 70.w,
                  child: Text(
                    'KYC \nDetails',
                    style: h1TextStyle.copyWith(
                      color: const Color(
                        0xFF0076B5,
                      ),
                      fontSize: 30.sp,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: textInputField(
                      'Aadhar Number',
                      const Icon(Icons.edit_outlined),
                      aadharController, (value) {
                    aadharNumber = value;
                  }),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: textInputField('Pan Number',
                      const Icon(Icons.edit_outlined), panController, (value) {
                    panNumber = value;
                  }),
                ),
                SizedBox(height: 4.h),
                Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        activeColor: bgColor1,
                        value: assuranceCheck1,
                        onChanged: (value) {
                          setState(() {
                            assuranceCheck1 = value!;
                          });
                        },
                      ),
                      SizedBox(
                        width: 70.w,
                        child: Text(
                          "By checking this box, I confirm the accuracy of my company's information and certify the authenticity of provided documents for loan application.",
                          style: normalTextStyle.copyWith(color: textBlack),
                          textAlign: TextAlign.start,
                          maxLines: 4,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        activeColor: bgColor1,
                        value: assuranceCheck2,
                        onChanged: (value) {
                          setState(() {
                            assuranceCheck2 = value!;
                          });
                        },
                      ),
                      SizedBox(
                        width: 70.w,
                        child: Text(
                          "I acknowledge and agree to abide by the terms and conditions governing the loan application process.",
                          style: normalTextStyle.copyWith(color: textBlack),
                          textAlign: TextAlign.start,
                          maxLines: 4,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: mainButton('Done', bgColor2, textWhite, () async {
                    const url = '${AppConfig.baseUrl}/user/signup';
                    final response = await http.post(
                      Uri.parse(url),
                      body: {
                        'username': widget.fullname,
                        'phone': widget.number,
                        'email': widget.email,
                        'password': widget.password,
                        'company_name': widget.companyName,
                        'registration_number': widget.regNo,
                        'company_age': widget.companyAge,
                        'industry': widget.industry,
                        'gst_number': widget.gstNo,
                        'aadhar_card': aadharNumber,
                        'pan_card': panNumber,
                      },
                    );

                    if (response.statusCode == 201) {
                      final user = json.decode(response.body)['user'];
                      final userId = user['id'];
                      debugPrint('this is user id $userId');
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen(
                                  userId: userId,
                                )),
                      );
                    } else {
                      // Handle error response
                      print('Error: ${response.body}');
                    }
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
