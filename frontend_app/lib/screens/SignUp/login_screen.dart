import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend_app/screens/home_screen.dart';
import 'package:frontend_app/widgets/config_prod.dart';
import 'package:frontend_app/widgets/constants/colors.dart';
import 'package:frontend_app/widgets/mainButton.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import '../../widgets/constants/texts.dart';
import '../../widgets/input_fields/textInputField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 65.w,
                padding: EdgeInsets.fromLTRB(5.w, 25.h, 5.w, 2.h),
                child: Text(
                  'Welcome \nBack!',
                  style: h1TextStyle.copyWith(
                    color: const Color(
                      0xFF0076B5,
                    ),
                    fontSize: 30.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.h, left: 5.w, right: 5.w),
                child: textInputField(
                    'Email',
                    const Icon(Icons.person_outline_rounded),
                    emailController, (value) {
                  email = value;
                }),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5.h, left: 5.w, right: 5.w),
                child: textInputField(
                    'Password',
                    const Icon(Icons.lock_outline_rounded),
                    passwordController, (value) {
                  password = value;
                }),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                child: mainButton('Login', bgColor1, textWhite, () async {
                  const url = '${AppConfig.baseUrl}/user/login';
                  final response = await http.post(
                    Uri.parse(url),
                    body: {
                      'email': email,
                      'password': password,
                    },
                  );

                  if (response.statusCode == 200) {
                    final user = json.decode(response.body)['user'];
                    debugPrint('this is the user $user');
                    final userId = (user)['_id'];
                    debugPrint('this is user id $userId');
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen(userId: userId)));
                  } else {
                    // Handle error response
                    print('Error: ${response.statusCode}');
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
