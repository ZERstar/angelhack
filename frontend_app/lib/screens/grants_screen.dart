import 'package:flutter/material.dart';
import 'package:frontend_app/widgets/constants/colors.dart';
import 'package:frontend_app/widgets/constants/texts.dart';
import 'package:sizer/sizer.dart';

import '../models/grants_json.dart';

class GrantScreen extends StatefulWidget {
  const GrantScreen({Key? key});

  @override
  State<GrantScreen> createState() => _GrantScreenState();
}

class _GrantScreenState extends State<GrantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          'Grants',
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
        child: ListView.builder(
          itemCount: grants.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    final grant = grants[index];
                    return Dialog(
                      child: Container(
                        padding: EdgeInsets.all(2.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: bgColor3, width: 0.5.h),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              grant['grant_name'],
                              style: h1TextStyle.copyWith(color: textBlack),
                            ),
                            Divider(
                              color: bgColor3,
                              thickness: 0.2.h,
                            ),
                            Text(
                              'Nature of Assistance',
                              style: h2TextStyle.copyWith(color: textBlack),
                            ),
                            Text(
                              grant['nature_of_assistance'],
                              style: normalTextStyle.copyWith(color: textBlack),
                            ),
                            Text(
                              'Eligibility Criteria',
                              style: h2TextStyle.copyWith(color: textBlack),
                            ),
                            Text(
                              grant['eligibility_criteria'],
                              style: normalTextStyle.copyWith(color: textBlack),
                            ),
                            Text(
                              'How to Apply',
                              style: h2TextStyle.copyWith(color: textBlack),
                            ),
                            Text(
                              grant['how_to_apply'],
                              style: normalTextStyle.copyWith(color: textBlack),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Card(
                child: ListTile(
                  title: Text(
                    grants[index]['grant_name'],
                    style: h2TextStyle.copyWith(color: textBlack),
                  ),
                  subtitle: Text(
                    grants[index]['how_to_apply'],
                    style: normalTextStyle.copyWith(color: textBlack),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
