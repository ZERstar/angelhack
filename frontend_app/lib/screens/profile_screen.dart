import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend_app/widgets/input_fields/phoneField.dart';
import 'package:frontend_app/widgets/input_fields/textInputField.dart';
import 'package:frontend_app/widgets/mainButton.dart';
import 'package:sizer/sizer.dart';

import '../widgets/constants/colors.dart';
import '../widgets/constants/texts.dart';
import 'SignUp/login_or_signup_screen.dart';
import 'notification_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isPersonal = false;
  bool isBusiness = false;
  bool isAccount = false;

  String fullname = '';
  String email = '';
  String phone = '';
  String aadhar = '';
  String pan = '';

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  TextEditingController panController = TextEditingController();

  String companyName = '';
  String registrationNumber = '';

  String industry = '';
  List industryList = [
    'Agriculture',
    'Construction',
    'Manufacturing',
    'Retail',
    'Services',
  ];
  String gstno = '';
  String payableGST = '';

  TextEditingController companyNameController = TextEditingController();
  TextEditingController registrationNumberController = TextEditingController();
  TextEditingController industryController = TextEditingController();
  TextEditingController gstnoController = TextEditingController();
  TextEditingController payableGSTController = TextEditingController();

  String bankName = '';
  String accountNumber = '';
  String ifsc = '';
  String annualRevenue = '';
  String totalAssets = '';
  String totalLiabilities = '';

  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  TextEditingController annualRevenueController = TextEditingController();
  TextEditingController totalAssetsController = TextEditingController();
  TextEditingController totalLiabilitiesController = TextEditingController();

  List labelText = [
    'Bank Name',
    'Account Number',
    'IFSC Code',
    'Annual Revenue',
    'Total Assets',
    'Total Liabilities'
  ];
  late List controllers = [
    bankNameController,
    accountNumberController,
    ifscController,
    annualRevenueController,
    totalAssetsController,
    totalLiabilitiesController
  ];
  late List values = [
    bankName,
    accountNumber,
    ifsc,
    annualRevenue,
    totalAssets,
    totalLiabilities
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2873b4),
        elevation: 0,
        foregroundColor: const Color(0xFF2873b4),
        surfaceTintColor: const Color(0xFF2873b4),
        title: Text(
          'Profile',
          style: h1TextStyle.copyWith(color: textWhite),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios, color: textWhite),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationScreen(),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 4.w,
                backgroundColor: bgColor3,
                child: Icon(
                  Icons.notifications_outlined,
                  color: textBlack,
                  size: 20.sp,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Positioned(
                top: 0,
                child: Container(
                  height: 10.h,
                  color: const Color(0xFF2873b4),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 78.h,
                  width: 100.w,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.h),
                      RichText(
                        text: TextSpan(
                          style: h2TextStyle.copyWith(
                              color: textBlack, fontWeight: FontWeight.w200),
                          children: [
                            TextSpan(
                                text: 'Profile completion : ',
                                style:
                                    normalTextStyle.copyWith(fontSize: 16.sp)),
                            TextSpan(
                              text: '75%',
                              style: h2TextStyle.copyWith(
                                  color: textBlack,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 2.h),
                      if (isPersonal)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Personal Details',
                                style: h2TextStyle.copyWith(color: textBlack),
                                textAlign: TextAlign.start,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: textInputField(
                                  'Full Name',
                                  const Icon(Icons.person_outline_rounded),
                                  fullNameController,
                                  (value) {
                                    fullname = value;
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: phoneField(
                                  (p0) {
                                    phone = p0;
                                  },
                                  const Icon(Icons.phone_android_outlined),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: textInputField(
                                  'Email',
                                  const Icon(Icons.email_outlined),
                                  emailController,
                                  (value) {
                                    email = value;
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: textInputField(
                                  'Aadhar Number',
                                  const Icon(Icons.lock_outline_rounded),
                                  aadharController,
                                  (value) {
                                    aadhar = value;
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: textInputField(
                                  'Pan Number',
                                  const Icon(Icons.lock_outline_rounded),
                                  panController,
                                  (value) {
                                    pan = value;
                                  },
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.w),
                                child:
                                    mainButton('Save', bgColor1, textWhite, () {
                                  setState(() {
                                    isPersonal = !isPersonal;
                                  });
                                }),
                              )
                            ],
                          ),
                        ),
                      if (isBusiness)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Company Details',
                                style: h2TextStyle.copyWith(color: textBlack),
                                textAlign: TextAlign.start,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: textInputField(
                                  'Company Name',
                                  const Icon(Icons.person_outline_rounded),
                                  companyNameController,
                                  (value) {
                                    companyName = value;
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: textInputField(
                                    'Registration Number',
                                    const Icon(Icons.mail_outline),
                                    registrationNumberController, (p0) {
                                  registrationNumber = p0;
                                }),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: Container(
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: textBlack, width: 0.1.h),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: DropdownButton(
                                    hint: Text(
                                      'Select Industry'.toUpperCase(),
                                      style: normalTextStyle.copyWith(
                                          color: textBlack),
                                    ),
                                    iconSize: 22.sp,
                                    iconEnabledColor: textBlack,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w),
                                    underline: Container(),
                                    isExpanded: true,
                                    items: industryList
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
                                  const Icon(Icons.edit_outlined),
                                  gstnoController,
                                  (value) {
                                    gstno = value;
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: textInputField(
                                  'Payable GST',
                                  const Icon(Icons.edit_outlined),
                                  payableGSTController,
                                  (value) {
                                    payableGST = value;
                                  },
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.w),
                                child:
                                    mainButton('Save', bgColor1, textWhite, () {
                                  setState(() {
                                    isBusiness = !isBusiness;
                                  });
                                }),
                              )
                            ],
                          ),
                        ),
                      if (isAccount)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Account Details',
                                style: h2TextStyle.copyWith(color: textBlack),
                                textAlign: TextAlign.start,
                              ),
                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: values.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(top: 1.5.h),
                                    child: textInputField(
                                        labelText[index],
                                        const Icon(Icons.edit_outlined),
                                        controllers[index], (value) {
                                      values[index] = value;
                                    }),
                                  );
                                },
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 2.h, right: 15.w, left: 15.w),
                                  child:
                                      mainButton('Save', bgColor1, textWhite, () {
                                    setState(() {
                                      isAccount = !isAccount;
                                    });
                                  })),
                            ],
                          ),
                        ),
                      if (isPersonal == false &&
                          isBusiness == false &&
                          isAccount == false)
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isPersonal = !isPersonal;
                                });
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 5.w, bottom: 2.h),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/personal_icon.png',
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      'Personal Details',
                                      style: normalTextStyle.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isBusiness = !isBusiness;
                                });
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 5.w, bottom: 2.h),
                                child: Row(children: [
                                  Image.asset(
                                    'assets/icons/company_icon.png',
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    'Company Details',
                                    style: normalTextStyle.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isAccount = !isAccount;
                                });
                              },
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 5.w, bottom: 2.h),
                                child: Row(children: [
                                  Image.asset(
                                    'assets/icons/account_icon.png',
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    'Account Details',
                                    style: normalTextStyle.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 5.w, bottom: 2.h),
                                child: Row(children: [
                                  Image.asset(
                                    'assets/icons/setting_icon.png',
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    'Settings',
                                    style: normalTextStyle.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: mainButton(
                                'Logout',
                                textWhite,
                                bgColor1,
                                () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginOrSignUpScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Positioned(
                top: 4.h,
                left: 35.w,
                child: SizedBox(
                  height: 12.h,
                  width: 26.w,
                  child: CircularProgressIndicator(
                    strokeCap: StrokeCap.round,
                    strokeWidth: 6.w,
                    color: colorNegative,
                    backgroundColor: colorPositive,
                    value: 0.32,
                    strokeAlign: BorderSide.strokeAlignCenter,
                  ),
                ),
              ),
              Positioned(
                top: 4.h,
                left: 35.w,
                child: Container(
                  height: 12.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  child: Image.asset('assets/images/profile.png',
                      fit: BoxFit.fill),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
