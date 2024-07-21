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
    return Scaffold(body:
      Column(children: [
        CheckoutForm(id: widget.id,)


      ],),);
  }
}
