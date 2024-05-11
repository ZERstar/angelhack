import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:frontend_app/screens/NavBar/borrow_body.dart';
import 'package:frontend_app/screens/NavBar/home_body.dart';
import 'package:frontend_app/screens/NavBar/market_place_body.dart';
import 'package:frontend_app/widgets/constants/colors.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController(initialPage: 0);

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
    const List<Widget> bottomBarPages = [
      BorrowBody(),
      HomeBody(),
      MarketPlaceBody(),
    ];
    return Scaffold(
      backgroundColor: bgColor3,
      extendBody: true,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              notchColor: bgColor1,
              notchBottomBarController: _controller,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home,
                    color: textBlack,
                  ),
                  activeItem: Icon(
                    Icons.home,
                    color: textWhite,
                  ),
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home,
                    color: textBlack,
                  ),
                  activeItem: Icon(
                    Icons.home,
                    color: textWhite,
                  ),
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home,
                    color: textBlack,
                  ),
                  activeItem: Icon(
                    Icons.home,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
