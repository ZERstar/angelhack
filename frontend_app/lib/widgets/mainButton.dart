import 'package:flutter/material.dart';
import 'package:frontend_app/widgets/constants/texts.dart';
import 'package:sizer/sizer.dart';

Widget mainButton(String buttonText,Color primaryColor, Color buttonTextColor, Function() route) {
  return Center(
    child: SizedBox(
      height: 7.h,
      width: 97.w,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
            (states) => primaryColor,
          ),
          elevation: MaterialStateProperty.resolveWith((states) => 2.0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
              
            ),
          ),
        ),
        child: Text(buttonText.toUpperCase(),
            style: h1TextStyle.copyWith(
                fontSize: 18.sp,
                color: buttonTextColor, fontWeight: FontWeight.w600)),
        onPressed: () => route(),
      ),
    ),
  );
}
