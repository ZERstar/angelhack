import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend_app/screens/SignUp/login_screen.dart';
import 'package:frontend_app/screens/SignUp/register_screen.dart';
import 'package:frontend_app/widgets/constants/colors.dart';
import 'package:frontend_app/widgets/constants/texts.dart';
import 'package:frontend_app/widgets/mainButton.dart';
import 'package:sizer/sizer.dart';

class LoginOrSignUpScreen extends StatefulWidget {
  const LoginOrSignUpScreen({super.key});

  @override
  State<LoginOrSignUpScreen> createState() => _LoginOrSignUpScreenState();
}

class _LoginOrSignUpScreenState extends State<LoginOrSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2873b4),
      body: Column(
        children: [
          const Spacer(),
          const Spacer(),
          const Spacer(),
          const Spacer(),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: mainButton('Sign Up', textWhite, bgColor1, () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterScreen()));
              })),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            child: Center(
              child: Text(
                'OR',
                style: h2TextStyle.copyWith(color: textWhite),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: mainButton('Login', bgColor1, textWhite, () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            }),
          ),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }
}
