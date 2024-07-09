import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickmart/core/widgets/app_text_button.dart';
import 'package:quickmart/features/login/data/Cubit/login_cubit.dart';
import 'package:quickmart/features/login/ui/widgets/Terms_Text.dart';
import 'package:quickmart/features/login/ui/widgets/email_and_password_formfield.dart';

import '../../../core/theming/Styles.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {



  @override
  Widget build(BuildContext context) {
    {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: SvgPicture.asset(
                      'assets/svgs/quickmartLogo.svg', width: 104.w,
                      height: 32.h,),
                  ),
                  SizedBox(height: 24.h,),
                  Text('Login', style: TextStyles.font24BlackBold,),
                  SizedBox(height: 8.h,),
                  Row(
                    children: [
                      Text('Don’t have an account?',
                        style: TextStyles.font14GrayRegular,),
                      Text('Signup', style: TextStyles.font13CyanRegular,),
                    ],
                  ),
                  SizedBox(height: 32.h,),
                  EmailAndPassword(),

                  SizedBox(height: 200.h,),
                  TermsTexts(),

                ],
              ),
            ),
          ),
        ),
      );
    }


  }

}
