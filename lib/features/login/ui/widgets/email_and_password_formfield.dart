import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickmart/core/theming/Styles.dart';
import 'package:quickmart/core/theming/colors.dart';
import 'package:quickmart/core/widgets/app_text_button.dart';
import 'package:quickmart/core/widgets/app_text_form_field.dart';

import 'package:quickmart/features/home/ui/home_screen.dart';
import 'package:quickmart/features/login/data/Cubit/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObsecureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is SignInSuccess) {

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Success')));
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        } else if (state is SignInFalure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return Form(
          key: context.read<LoginCubit>().signInFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email',
                style: TextStyles.font14BlackMedium,
              ),
              SizedBox(
                height: 8.h,
              ),
              AppTextFormField(
                controller: context.read<LoginCubit>().signInEmail,
                hintText: 'Enter your Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email cannot be empty';
                  }
                  const pattern =
                      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$";
                  final regex = RegExp(pattern);
                  return !regex.hasMatch(value)
                      ? 'Enter a valid email address'
                      : null;
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Password',
                style: TextStyles.font14BlackMedium,
              ),
              SizedBox(
                height: 8.h,
              ),
              AppTextFormField(
                controller: context.read<LoginCubit>().signInPassword,
                hintText: 'Enter your Password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password cannot be empty';
                  } else if (value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  } else if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
                    return 'Password must contain at least one lowercase letter';
                  } else if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
                    return 'Password must contain at least one uppercase letter';
                  } else if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
                    return 'Password must contain at least one number';
                  } else if (!RegExp(r'(?=.*[@$!%*?&])').hasMatch(value)) {
                    return 'Password must contain at least one special character';
                  }
                  return null;
                },
                isObscureText: isObsecureText,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isObsecureText = !isObsecureText;
                    });
                  },
                  child: isObsecureText
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Forgot password?',
                style: TextStyles.font13CyanRegular,
              ),
              SizedBox(
                height: 24.h,
              ),
              state is SignInLoading
                  ? Center(child: CircularProgressIndicator(color: ColorsManager.Black,))
                  : AppTextButton(
                buttonText: 'Login',
                textStyle: TextStyles.font12WhiteBold,
                onPressed: () {
                  context.read<LoginCubit>().signIn();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
