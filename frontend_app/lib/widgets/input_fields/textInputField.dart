import 'package:flutter/material.dart';
import 'package:frontend_app/widgets/constants/colors.dart';
import 'package:frontend_app/widgets/constants/texts.dart';
import 'package:sizer/sizer.dart';

Widget textInputField(String labelText, Icon icon,
    TextEditingController controller, Function(String) onInputChanged) {
  controller.addListener(() {
    onInputChanged(controller.text);
  });
  return Material(
    elevation: 3.0,
    borderRadius: BorderRadius.circular(7),
    child: TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: icon,
        suffixIconColor: Colors.black,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(color: textBlack, width: 0.1.h),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(color: textBlack, width: 0.1.h),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        labelText: labelText.toUpperCase(),
        labelStyle: normalTextStyle.copyWith(color: textBlack),
      ),
      onChanged: (value) {
        onInputChanged(value);
      },
    ),
  );
}
