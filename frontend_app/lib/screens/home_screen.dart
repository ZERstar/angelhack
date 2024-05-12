import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_app/screens/NavBar/borrow_body.dart';
import 'package:frontend_app/screens/NavBar/home_body.dart';
import 'package:frontend_app/screens/NavBar/market_place_body.dart';
import 'package:frontend_app/widgets/constants/colors.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  final String userId;

  const HomeScreen({required this.userId, Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController(initialPage: 1);

  final NotchBottomBarController _controller =
      NotchBottomBarController(index: 1);

  int maxCount = 3;

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String id = widget.userId;
    List<Widget> bottomBarPages = [
      BorrowBody(id: id),
      HomeBody(
        userId: id,
      ),
      const MarketPlaceBody(),
    ];
    return Scaffold(
      backgroundColor: const Color(0xFFf1f1f1),
      extendBody: true,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              showBottomRadius: true,
              bottomBarHeight: 8.h,
              bottomBarWidth: 95.w,
              notchColor: bgColor1,
              notchBottomBarController: _controller,
              bottomBarItems: [
                BottomBarItem(
                  inActiveItem: SvgPicture.asset(
                    'assets/icons/borrow.svg',
                    color: textBlack,
                  ),
                  activeItem: SvgPicture.asset(
                    'assets/icons/borrow.svg',
                    color: textWhite,
                  ),
                ),
                const BottomBarItem(
                  inActiveItem: Icon(Icons.home_outlined, color: textBlack),
                  activeItem: Icon(Icons.home_outlined, color: textWhite),
                ),
                BottomBarItem(
                  inActiveItem: SvgPicture.asset(
                    'assets/icons/marketplace.svg',
                    color: textBlack,
                  ),
                  activeItem: SvgPicture.asset(
                    'assets/icons/marketplace.svg',
                    color: textWhite,
                  ),
                ),
              ],
              onTap: (int value) {
                _pageController.jumpToPage(value);
              },
              kIconSize: 20.sp,
              kBottomRadius: 3.h,
            )
          : null,
    );
  }
}
