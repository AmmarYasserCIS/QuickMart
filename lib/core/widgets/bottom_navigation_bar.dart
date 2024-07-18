import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quickmart/core/theming/colors.dart';
import 'package:quickmart/features/cart/ui/cart.dart';

import 'package:quickmart/features/home/ui/home_screen.dart';
import 'package:quickmart/features/profile/ui/profile.dart';

import 'package:quickmart/features/wishlist/ui/wishlist.dart';


class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({super.key});

  @override
  State<bottomNavigationBar> createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  final List<Widget> _pages = [
    HomeScreen(),
    CartScreen(),
    WishlistScreen(),
    ProfileScreen()

  ];
  int  _currentIndex = 0 ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        fixedColor: ColorsManager.mainCyan,
        unselectedItemColor:Colors.grey ,

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/home-2.svg',
              color: _currentIndex == 0 ? ColorsManager.mainCyan : Colors.grey,
              width: 32.w,
              height: 32.h,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/shopping-cart.svg',
              color: _currentIndex == 1 ? ColorsManager.mainCyan : Colors.grey,
              width: 32.w,
              height: 32.h,
            ),
            label: 'My Cart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/heart.svg',
              color: _currentIndex == 2 ? ColorsManager.mainCyan : Colors.grey,
              width: 32.w,
              height: 32.h,
            ),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/profile.svg',
              color: _currentIndex == 3 ? ColorsManager.mainCyan : Colors.grey,
              width: 32.w,
              height: 32.h,
            ),
            label: 'Profile',
          ),


        ],
      ),
    );
  }
}

