import 'package:flutter/material.dart';
import 'package:frontend_app/widgets/constants/texts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sizer/sizer.dart';

import '../widgets/constants/colors.dart';
import '../widgets/mainButton.dart';
import 'SignUp/login_or_signup_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<OnBoardingScreenState>();
  int currentPageIndex = 0;

  void _onPageChange(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  Widget _buildImage(String assetName) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Image.asset(
        'assets/images/$assetName',
        height: 30.h,
        width: 98.w,
      ),
    );
  }

  routeLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginOrSignUpScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pageDecoration = PageDecoration(
      titleTextStyle: h2TextStyle.copyWith(color: bgColor1),
      bodyTextStyle: normalTextStyle,
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: currentPageIndex != 2
                ? TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent,
                      ),
                    ),
                    onPressed: () => routeLogin(),
                    child: Text(
                      'Skip',
                      style: normalTextStyle.copyWith(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  )
                : null,
          ),
        ),
      ),
      globalFooter: currentPageIndex == 2
          ? Padding(
              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
              child: mainButton('Next', bgColor1, textWhite, routeLogin),
            )
          : SizedBox(
              height: 15.2.h,
            ),
      pages: [
        PageViewModel(
          title: "Saaधन",
          body: "Fuel your Growth, Master your Finance",
          image: _buildImage('asset_1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Growing Together",
          body: "Nurturing your business growth, side by side.",
          image: _buildImage('asset_2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Namaste !!!",
          body: "Let's make credit worthy for all.",
          image: _buildImage('asset_3.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () {},
      onSkip: () {},
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      showDoneButton: false,
      showNextButton: false,
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: const EdgeInsets.all(12.0),
      dotsDecorator: DotsDecorator(
        size: Size(1.5.h, 1.2.h),
        color: Colors.grey,
        activeSize: Size(1.5.h, 1.5.h),
        activeColor: bgColor1,
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
      onChange: _onPageChange,
    );
  }
}
