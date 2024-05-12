import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend_app/screens/SignUp/company_details_screen.dart';
import 'package:frontend_app/widgets/input_fields/passwordField.dart';
import 'package:frontend_app/widgets/input_fields/phoneField.dart';
import 'package:frontend_app/widgets/input_fields/textInputField.dart';
import 'package:frontend_app/widgets/mainButton.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/constants/colors.dart';
import '../../widgets/constants/texts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String fullname = '';
  final fullNameController = TextEditingController();

  String number = '';
  final phoneNumberController = TextEditingController();

  String email = '';
  final emailController = TextEditingController();

  String password = '';
  final passwordController = TextEditingController();

  String confirmPassword = '';
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 70.w,
              child: Text(
                'Create \nyour account',
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
                  'Full Name',
                  const Icon(Icons.person_outline_rounded),
                  fullNameController, (value) {
                fullname = value;
              }),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: phoneField((value) {
                number = value;
              }, const Icon(Icons.phone_android)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: textInputField(
                  'Email',
                  const Icon(Icons.mail_outline_rounded),
                  emailController, (value) {
                email = value;
              }),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: PasswordField(
                  labelText: 'Password',
                  onValueChanged: (value) {
                    password = value;
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: PasswordField(
                  labelText: 'Confirm Password',
                  onValueChanged: (value) {
                    confirmPassword = value;
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child:
                  mainButton('Next', const Color(0xFF6caff4), textWhite, () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CompanyDetailScreen(),
                    ));
              }),
            )
          ],
        ),
      ),
    );
  }
}
