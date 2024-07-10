import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quickmart/core/theming/Styles.dart';
import 'package:quickmart/features/sign_up/ui/widgets/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SvgPicture.asset(
                  'assets/svgs/quickmartLogo.svg',
                  width: 104.w,
                  height: 32.h,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Signup',
                style: TextStyles.font24BlackBold,
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyles.font14GrayRegular,
                  ),
                  InkWell(onTap: () {
                    Navigator.pop(context);
                  },
                    child: Text(
                      'Login',
                      style: TextStyles.font13CyanRegular,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              SignupForm(),
            ],
          ),
        ),
      )),
    );
  }
}
