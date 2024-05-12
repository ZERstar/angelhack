import 'package:flutter/material.dart';
import 'package:frontend_app/widgets/constants/colors.dart';
import 'package:frontend_app/widgets/constants/texts.dart';
import 'package:sizer/sizer.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

Widget phoneField(Function(String) onPhoneNumberChanged, Icon icon) {
  TextEditingController controller = TextEditingController();
  controller.addListener(() {
    onPhoneNumberChanged(controller.text);
  });
  return Material(
    elevation: 3.0,
    borderRadius: BorderRadius.circular(7.0),
    child: IntlPhoneField(
      disableLengthCheck: true,
      keyboardType: TextInputType.phone,
      showDropdownIcon: false,
      flagsButtonPadding: EdgeInsets.symmetric(horizontal: 3.w),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
      ),
      decoration: InputDecoration(
        suffixIcon: icon,
        suffixIconColor: textBlack,
        labelText: 'Mobile'.toString().toUpperCase(),
        labelStyle: normalTextStyle.copyWith(color: textBlack),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: BorderSide(color: textBlack, width: 0.1.h),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: BorderSide(color: textBlack, width: 0.1.h),
        ),
      ),
      dropdownTextStyle: TextStyle(
        color: textBlack,
        fontFamily: 'Poppins',
        fontSize: 13.sp,
      ),
      initialCountryCode: 'IN',
      onChanged: (phone) {
        onPhoneNumberChanged(phone.completeNumber);
      },
    ),
  );
}
