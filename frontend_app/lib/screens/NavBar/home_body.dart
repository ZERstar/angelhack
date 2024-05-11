import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend_app/widgets/constants/colors.dart';
import 'package:frontend_app/widgets/constants/texts.dart';
import 'package:sizer/sizer.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: 0,
        child: Container(
          width: 100.w,
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
                    CircleAvatar(
                      radius: 6.w,
                      backgroundColor: textBlack,
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
                          style: h2TextStyle.copyWith(
                            color: textWhite,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: 4.w,
                      backgroundColor: bgColor3,
                      child: Icon(
                        Icons.notifications_outlined,
                        color: textBlack,
                        size: 20.sp,
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => Dialog(
                              child: Container(
                                  height: 20.h,
                                  child: Center(
                                      child: const Text('Coming Soon...'))),
                            ));
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
      )
    ]);
  }
}
