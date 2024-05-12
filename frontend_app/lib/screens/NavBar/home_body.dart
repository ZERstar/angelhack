import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../models/grants_json.dart';
import '../../widgets/HomeBody/gauge_meter.dart';
import '../../widgets/constants/colors.dart';
import '../../widgets/constants/texts.dart';
import '../grants_screen.dart';
import '../notification_screen.dart';
import '../profile_screen.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 100.w,
          height: 55.h,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: bgColor1,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: Column(
              children: [
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileScreen(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 6.w,
                        backgroundColor: textBlack,
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back,',
                          style: h1TextStyle.copyWith(
                            color: textWhite,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          'Company Name',
                          style: normalTextStyle.copyWith(
                            color: textWhite,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationScreen(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 5.w,
                        backgroundColor: bgColor3,
                        child: Icon(
                          Icons.notifications_outlined,
                          color: textBlack,
                          size: 20.sp,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  width: 100.w,
                  height: 29.h,
                  padding: EdgeInsets.only(top: 2.h, right: 1.w),
                  child: gauge_meter(63),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 0.5.h),
                        decoration: BoxDecoration(
                          color: bgColor3,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 1.5.w,
                              backgroundColor: colorPositive,
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              'Paid',
                              style: normalTextStyle.copyWith(
                                color: textBlack,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 0.5.h),
                        decoration: BoxDecoration(
                          color: bgColor3,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 1.5.w,
                              backgroundColor: colorNegative,
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              'Loans due',
                              style: normalTextStyle.copyWith(
                                color: textBlack,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Container(
                          decoration: BoxDecoration(
                            color: textWhite,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: bgColor2,
                              width: 1.h,
                            ),
                          ),
                          child: DataTable(
                            columns: const [
                              DataColumn(label: Text('Type')),
                              DataColumn(label: Text('Amount')),
                            ],
                            showCheckboxColumn: false,
                            rows: const [
                              DataRow(
                                cells: [
                                  DataCell(Text('Paid Loan Amount')),
                                  DataCell(Text('75000')),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(Text('Remaining Loan Amount')),
                                  DataCell(Text('125000')),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(Text('Total Loan Amount')),
                                  DataCell(Text('200000')),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      'View Details',
                      style: normalTextStyle.copyWith(color: textWhite),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color(0xfff1f1f1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 6.h,
                padding: EdgeInsets.only(left: 5.w, top: 2.h, right: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Check Grants',
                      style: h2TextStyle.copyWith(color: textBlack),
                      maxLines: 1,
                      textAlign: TextAlign.start,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GrantScreen()));
                      },
                      child: Text(
                        'See more',
                        style: normalTextStyle.copyWith(
                          color: bgColor1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 100.w,
                height: 30.h,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: ListView.builder(
                  itemCount: grants.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      color: bgColor3,
                      key: Key(grants[index]["grant_name"]),
                      child: ListTile(
                        title: Text(
                          grants[index]["grant_name"],
                          style: h2TextStyle.copyWith(color: textBlack),
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          grants[index]["eligibility_criteria"],
                          style: normalTextStyle.copyWith(color: textBlack),
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
