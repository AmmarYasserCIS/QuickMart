import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickmart/core/theming/Styles.dart';
import 'package:quickmart/core/widgets/app_text_button.dart';
import 'package:quickmart/core/widgets/app_text_form_field.dart';
import 'package:quickmart/features/cart/data/cubit/checkout_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckoutForm extends StatefulWidget {
  final String id;

  const CheckoutForm({super.key, required this.id});

  @override
  State<CheckoutForm> createState() => _CheckoutFormState();
}

class _CheckoutFormState extends State<CheckoutForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) async {
        if (state is CheckoutSuccess) {
          final url = state.checkourmodel.url;
          final uri = Uri.parse(url);

          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Could not launch $url')),
            );
          }
        } else if (state is CheckoutFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: context.read<CheckoutCubit>().checkoutFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'City',
                style: TextStyles.font14BlackMedium,
              ),
              SizedBox(height: 8.h),
              AppTextFormField(
                controller: context.read<CheckoutCubit>().checkoutCity,
                hintText: 'Enter your City',
                validator: (value) => value?.isEmpty ?? true ? 'City is required' : null,
              ),
              SizedBox(height: 16.h),
              Text(
                'Phone Number',
                style: TextStyles.font14BlackMedium,
              ),
              SizedBox(height: 8.h),
              AppTextFormField(
                controller: context.read<CheckoutCubit>().checkoutPhone,
                hintText: 'Enter your Phone Number',
                validator: (value) => value?.isEmpty ?? true ? 'Phone number is required' : null,
              ),
              SizedBox(height: 16.h),
              Text(
                'Details',
                style: TextStyles.font14BlackMedium,
              ),
              SizedBox(height: 8.h),
              AppTextFormField(
                controller: context.read<CheckoutCubit>().checkoutDetails,
                hintText: 'Details',
                validator: (value) => value?.isEmpty ?? true ? 'Details are required' : null,
              ),
              SizedBox(height: 16.h),
              AppTextButton(
                borderRadius: 12,
                backgroundColor: Colors.black,
                buttonText: 'Checkout',
                textStyle: TextStyles.font14BlackSemiBold.copyWith(
                  color: Colors.white,
                  fontSize: 13.sp,
                ),
                onPressed: () {
                  if (context.read<CheckoutCubit>().checkoutFormKey.currentState?.validate() ?? false) {
                    context.read<CheckoutCubit>().checkout(widget.id);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
