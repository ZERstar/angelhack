import 'package:flutter/material.dart';

import '../../widgets/constants/colors.dart';
import '../../widgets/constants/texts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          'Profile',
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
    );
  }
}
