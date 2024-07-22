import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quickmart/core/theming/Styles.dart';
import 'package:quickmart/core/theming/colors.dart';
import 'package:quickmart/features/login/ui/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              OnboardingStep(
                imagePath: 'assets/images/onboarding1.png',
                title: 'Explore a wide range of products',
                description: 'Explore a wide range of products at your fingertips. QuickMart offers an extensive collection to suit your needs.',
                pageController: _pageController,
                currentPage: _currentPage,
              ),
              OnboardingStep(
                imagePath: 'assets/images/onboarding2.png',
                title: 'Unlock exclusive offers and discounts',
                description: 'Get access to limited-time deals and special promotions available only to our valued customers.',
                pageController: _pageController,
                currentPage: _currentPage,
              ),
              OnboardingStep(
                imagePath: 'assets/images/onboarding3.png',
                title: 'Safe and secure payments',
                description: ' QuickMart employs industry-leading encryption and trusted payment gateways to safeguard your financial information.',
                pageController: _pageController,
                currentPage: _currentPage,
              ),
            ],
          ),
          Positioned(
            top: 25.h,
            right: 16.w,
            child: TextButton(
              child: Text(
                'Skip for now',
                style: TextStyles.font13CyanRegular,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginScreen()));
              },
            ),
          ),
          Positioned(
            bottom: 16.h,
            left: 16.w,
            right: 16.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 64.0, vertical: 16.0),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    _currentPage == 2 ? 'Get Started' : 'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (_currentPage == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
                SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 3; i++)
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 8.0,
                        width: i == _currentPage ? 24.0 : 8.0,
                        margin: EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          color: i == _currentPage
                              ? ColorsManager.mainCyan
                              : Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingStep extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final PageController pageController;
  final int currentPage;

  const OnboardingStep({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.pageController,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [SizedBox(height: 140.h,),
          Image.asset(imagePath),
          SizedBox(height: 32.0),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyles.font24BlackBold,
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyles.font14GrayRegular,
            ),
          ),
        ],
      ),
    );
  }
}
