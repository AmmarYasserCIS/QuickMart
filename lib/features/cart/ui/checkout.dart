import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickmart/core/theming/Styles.dart';
import 'package:quickmart/core/widgets/app_text_form_field.dart';
import 'package:quickmart/features/cart/ui/widgets/checkout_form.dart';

class CheckoutScreen extends StatefulWidget {
  final String id;

  CheckoutScreen({super.key, required this.id});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Checkout"),centerTitle: true,),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [SizedBox(height: 30.h,),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: CheckoutForm(
                    id: widget.id,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
