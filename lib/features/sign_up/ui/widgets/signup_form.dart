import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickmart/core/theming/Styles.dart';
import 'package:quickmart/core/widgets/app_text_button.dart';
import 'package:quickmart/core/widgets/app_text_form_field.dart';
import 'package:quickmart/features/sign_up/data/cubit/signup_cubit.dart';

class SignupForm extends StatefulWidget {
  
   SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isObsecureText=false;
  @override
  
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('success')));
        } else if (state is SignUpFalure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
  builder: (context, state) {
    return Form(
      key: context.read<SignupCubit>().signupFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Full Name',
            style: TextStyles.font14BlackMedium,
          ),
          SizedBox(
            height: 8.h,
          ),
          AppTextFormField(hintText: 'Enter Your Full Name', validator: (p0) {

          },
          controller: context.read<SignupCubit>().signupName,),
          SizedBox(height: 16.h,),
          Text(
            'Email',
            style: TextStyles.font14BlackMedium,
          ),
          SizedBox(
            height: 8.h,
          ),
          AppTextFormField(
            controller: context.read<SignupCubit>().signupEmail,
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
            controller: context.read<SignupCubit>().signupPassword,
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
          Text(
            'Phone',
            style: TextStyles.font14BlackMedium,
          ),
          SizedBox(
            height: 8.h,
          ),
          AppTextFormField(textInputType: TextInputType.phone,hintText: 'Enter Your Phone', validator: (p0) {

          },
            controller: context.read<SignupCubit>().signupPhone,),
          SizedBox(
            height: 32.h,
          ),
          state is SignupCubit
              ? Center(child: CircularProgressIndicator())
              : AppTextButton(
            buttonText: 'Create Account',
            textStyle: TextStyles.font12WhiteBold,
            onPressed: () {
              
              context.read<SignupCubit>().signUp();
            },
          ),
        ],
      ),
    );
  },
);
  }
}
