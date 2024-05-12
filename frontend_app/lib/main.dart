import 'package:flutter/material.dart';
import 'package:frontend_app/screens/SignUp/login_or_signup_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return const MaterialApp(
          title: 'Saaधन',
          debugShowCheckedModeBanner: false,
          home: LoginOrSignUpScreen(),
        );
      },
    );
  }
}
