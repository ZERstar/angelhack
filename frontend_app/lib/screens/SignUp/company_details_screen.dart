import 'package:flutter/material.dart';
import 'package:frontend_app/screens/SignUp/kyc_details_screen.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/constants/colors.dart';
import '../../widgets/constants/texts.dart';
import '../../widgets/input_fields/textInputField.dart';
import '../../widgets/mainButton.dart';

class CompanyDetailScreen extends StatefulWidget {
  final String fullname;
  final String number;
  final String email;
  final String password;
  final String confirmPassword;

  const CompanyDetailScreen({
    Key? key,
    required this.fullname,
    required this.number,
    required this.email,
    required this.password,
    required this.confirmPassword,
  }) : super(key: key);

  @override
  State<CompanyDetailScreen> createState() => _CompanyDetailScreenState();
}

class _CompanyDetailScreenState extends State<CompanyDetailScreen> {
  String companyName = '';
  TextEditingController companyNameController = TextEditingController();

  String regNo = '';
  TextEditingController regNoController = TextEditingController();

  String companyAge = '';
  TextEditingController companyAgeController = TextEditingController();

  String industry = '';
  List<String> industries = [
    'Education',
    'Healthcare',
    'Manufacturing',
    'Retail',
    'Technology',
  ];
  TextEditingController industryController = TextEditingController();

  String gstNo = '';
  TextEditingController gstNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 100.h,
          width: 100.w,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/company_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              SizedBox(
                width: 70.w,
                child: Text(
                  'Company \nDetails',
                  style: h1TextStyle.copyWith(
                    color: const Color(0xFF0076B5),
                    fontSize: 28.sp,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: textInputField(
                    'Company Name',
                    const Icon(Icons.person_outline_rounded),
                    companyNameController, (value) {
                  companyName = value;
                }),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: textInputField(
                    'Registration Number',
                    const Icon(Icons.mail_outline_rounded),
                    regNoController, (value) {
                  regNo = value;
                }),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: textInputField(
                    'Company Age',
                    const Icon(Icons.edit_outlined),
                    companyAgeController, (value) {
                  companyAge = value;
                }),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: textBlack, width: 0.1.h),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: DropdownButton(
                    hint: Text(
                      'Select Industry'.toUpperCase(),
                      style: normalTextStyle.copyWith(color: textBlack),
                    ),
                    iconSize: 22.sp,
                    iconEnabledColor: textBlack,
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    underline: Container(),
                    isExpanded: true,
                    items: industries
                        .map((ind) => DropdownMenuItem(
                              child: Text(ind),
                              value: ind,
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        industry = value.toString();
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: textInputField(
                    'GST Number',
                    const Icon(Icons.travel_explore_outlined),
                    gstNoController, (value) {
                  gstNo = value;
                }),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child:
                    mainButton('Next', const Color(0xFF6caff4), textWhite, () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KYCDetailScreen(
                          fullname: widget.fullname,
                          number: widget.number,
                          email: widget.email,
                          password: widget.password,
                          confirmPassword: widget.confirmPassword,
                          companyName: companyName,
                          regNo: regNo,
                          companyAge: companyAge,
                          industry: industry,
                          gstNo: gstNo,
                        ),
                      ));
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
