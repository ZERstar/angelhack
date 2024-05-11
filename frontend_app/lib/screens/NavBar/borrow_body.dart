import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/constants/colors.dart';
import '../../widgets/constants/texts.dart';
import '../notification_screen.dart';

class BorrowBody extends StatefulWidget {
  const BorrowBody({Key? key}) : super(key: key);

  @override
  State<BorrowBody> createState() => _BorrowBodyState();
}

class _BorrowBodyState extends State<BorrowBody> {
  bool isLoanSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor1,
        elevation: 0,
        title: Text(
          'Borrow',
          style: h1TextStyle.copyWith(color: textWhite),
        ),
        centerTitle: true,
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
                radius: 5.w,
                backgroundColor: bgColor3,
                child: Icon(
                  Icons.notifications_outlined,
                  color: textBlack,
                  size: 20.sp,
                ),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: 100.w,
              height: 20.h,
              decoration: const BoxDecoration(
                color: bgColor1,
              ),
              padding: EdgeInsets.fromLTRB(5.w, 1.h, 5.w, 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLoanSelected = !isLoanSelected;
                      });
                    },
                    child: Material(
                      elevation: 2,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      color: isLoanSelected ? textWhite : bgColor3,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 0.5.h),
                        child: Text(
                          'Loans',
                          style: h2TextStyle.copyWith(
                              color: isLoanSelected ? textBlack : bgColor1),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLoanSelected = !isLoanSelected;
                      });
                    },
                    child: Material(
                      elevation: 2,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      color: isLoanSelected ? bgColor3 : textWhite,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 0.5.h),
                        child: Text(
                          'Credit Card',
                          style: h2TextStyle.copyWith(
                              color: isLoanSelected ? bgColor1 : textBlack),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 78.h,
              width: 100.w,
              padding: EdgeInsets.symmetric(vertical: 1.h),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
                color: Color(0xfff1f1f1),
              ),
              child: isLoanSelected ? const Loans() : const CreditCard(),
            ),
          ),
        ],
      ),
    );
  }
}

class Loans extends StatefulWidget {
  const Loans({super.key});

  @override
  State<Loans> createState() => _LoansState();
}

class _LoansState extends State<Loans> {
  List workingCapital = [
    'Purchase Finance',
    'Vendor Finance',
    'Working Capital',
  ];
  List termLoans = [
    'Business Loan',
    'Machinery Loan',
    'Collateral Loan',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 3.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              'Working Capital Finance:',
              style: h2TextStyle.copyWith(
                color: textBlack,
              ),
              maxLines: 1,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              'Manage your cash flow shortfalls with our working capital financing solutions.',
              style:
                  normalTextStyle.copyWith(color: textBlack, fontSize: 12.sp),
              maxLines: 2,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 20.h,
            child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    margin: EdgeInsets.fromLTRB(5.w, 1.h, 0, 1.h),
                    width: 40.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF79b3fd),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${workingCapital[index]}',
                          style: h2TextStyle.copyWith(color: textWhite),
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (builder) => Container(
                                margin:
                                    EdgeInsets.fromLTRB(2.w, 22.h, 2.w, 23.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: textWhite,
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.w, vertical: 2.h),
                                      child: Row(
                                        children: [
                                          const Spacer(),
                                          Text(
                                            '${workingCapital[index]}',
                                            style: h1TextStyle.copyWith(
                                                color: textBlack),
                                            maxLines: 1,
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Icon(
                                              Icons.close,
                                              color: textBlack,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.w, vertical: 1.h),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 30.w,
                                            child: Text(
                                              'About:',
                                              style: h2TextStyle.copyWith(
                                                  color: textBlack,
                                                  fontSize: 14.sp),
                                              maxLines: 1,
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const Spacer(),
                                          SizedBox(
                                            width: 55.w,
                                            child: Text(
                                              'Procure raw materials at the right price',
                                              style: h2TextStyle.copyWith(
                                                  color: textBlack,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w200),
                                              maxLines: 2,
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                      thickness: 0.2.h,
                                      indent: 5.w,
                                      endIndent: 5.w,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.w, vertical: 1.h),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 30.w,
                                            child: Text(
                                              'Eligibility:',
                                              style: h2TextStyle.copyWith(
                                                  color: textBlack,
                                                  fontSize: 14.sp),
                                              maxLines: 1,
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const Spacer(),
                                          SizedBox(
                                            width: 55.w,
                                            child: Text(
                                              '1.Min. turnover Rs. 3 Crores.\n2.Business Vintage 3+ years.',
                                              style: h2TextStyle.copyWith(
                                                  color: textBlack,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w200),
                                              maxLines: 5,
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                      thickness: 0.2.h,
                                      indent: 5.w,
                                      endIndent: 5.w,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.w, vertical: 1.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 55.w,
                                            child: Text(
                                              'Loan Calculator',
                                              style: h2TextStyle.copyWith(
                                                  color: textBlack,
                                                  fontSize: 14.sp),
                                              maxLines: 1,
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const Spacer(),
                                          SizedBox(
                                            width: 30.w,
                                            child: Text(
                                              'Click Here',
                                              style: h2TextStyle.copyWith(
                                                  color: bgColor1,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w200),
                                              maxLines: 2,
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.h),
                                      child: Material(
                                        elevation: 3,
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.w, vertical: 2.h),
                                          decoration: BoxDecoration(
                                            color: bgColor1,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            'Apply Now',
                                            style: h2TextStyle.copyWith(
                                                color: textWhite,
                                                fontSize: 14.sp),
                                            maxLines: 1,
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'View Details',
                            style: normalTextStyle.copyWith(
                                color: textWhite, fontSize: 10.sp),
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              'Term Loans',
              style: h2TextStyle.copyWith(
                color: textBlack,
              ),
              maxLines: 1,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              'Fund your business expansion with our long term financing.',
              style:
                  normalTextStyle.copyWith(color: textBlack, fontSize: 12.sp),
              maxLines: 2,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 20.h,
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  margin: EdgeInsets.fromLTRB(5.w, 1.h, 0, 1.h),
                  width: 40.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF79b3fd),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${termLoans[index]}',
                        style: h2TextStyle.copyWith(color: textWhite),
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (builder) => Container(
                              margin: EdgeInsets.fromLTRB(2.w, 22.h, 2.w, 23.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: textWhite,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.w, vertical: 2.h),
                                    child: Row(
                                      children: [
                                        const Spacer(),
                                        Text(
                                          '${termLoans[index]}',
                                          style: h1TextStyle.copyWith(
                                              color: textBlack),
                                          maxLines: 1,
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Icon(
                                            Icons.close,
                                            color: textBlack,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.w, vertical: 1.h),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 30.w,
                                          child: Text(
                                            'About:',
                                            style: h2TextStyle.copyWith(
                                                color: textBlack,
                                                fontSize: 14.sp),
                                            maxLines: 1,
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          width: 55.w,
                                          child: Text(
                                            'Procure raw materials at the right price',
                                            style: h2TextStyle.copyWith(
                                                color: textBlack,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w200),
                                            maxLines: 2,
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                    thickness: 0.2.h,
                                    indent: 5.w,
                                    endIndent: 5.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.w, vertical: 1.h),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 30.w,
                                          child: Text(
                                            'Eligibility:',
                                            style: h2TextStyle.copyWith(
                                                color: textBlack,
                                                fontSize: 14.sp),
                                            maxLines: 1,
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          width: 55.w,
                                          child: Text(
                                            '1.Min. turnover Rs. 3 Crores.\n2.Business Vintage 3+ years.',
                                            style: h2TextStyle.copyWith(
                                                color: textBlack,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w200),
                                            maxLines: 5,
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.grey,
                                    thickness: 0.2.h,
                                    indent: 5.w,
                                    endIndent: 5.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.w, vertical: 1.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 55.w,
                                          child: Text(
                                            'Loan Calculator',
                                            style: h2TextStyle.copyWith(
                                                color: textBlack,
                                                fontSize: 14.sp),
                                            maxLines: 1,
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          width: 30.w,
                                          child: Text(
                                            'Click Here',
                                            style: h2TextStyle.copyWith(
                                                color: bgColor1,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w200),
                                            maxLines: 2,
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 2.h),
                                    child: Material(
                                      elevation: 3,
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w, vertical: 2.h),
                                        decoration: BoxDecoration(
                                          color: bgColor1,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          'Apply Now',
                                          style: h2TextStyle.copyWith(
                                              color: textWhite,
                                              fontSize: 14.sp),
                                          maxLines: 1,
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'View Details',
                          style: normalTextStyle.copyWith(
                              color: textWhite, fontSize: 10.sp),
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CreditCard extends StatefulWidget {
  const CreditCard({super.key});

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  bool isFrontVisible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.h,
      width: 100.w,
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isFrontVisible = !isFrontVisible;
              });
            },
            child: Image.asset(
              isFrontVisible
                  ? 'assets/images/card_front.png'
                  : 'assets/images/card_back.png',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
