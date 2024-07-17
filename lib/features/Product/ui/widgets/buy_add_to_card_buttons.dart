import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickmart/core/theming/Styles.dart';
import 'package:quickmart/core/widgets/app_text_button.dart';
import 'package:quickmart/features/Product/data/cubit/add_cart_cubit.dart';

class BuyBowButtons extends StatefulWidget {
  BuyBowButtons({super.key, required this.id});
  final String id;

  @override
  State<BuyBowButtons> createState() => _BuyBowButtonsState();
}

class _BuyBowButtonsState extends State<BuyBowButtons> {
  bool isAddedToCart = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCartCubit, AddCartState>(
      listener: (context, state) {
        if (state is AddCartSuccess) {
          setState(() {
            isAddedToCart = true;
          });
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Item Added to Cart')));
        } else if (state is AddCartFaliure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: AppTextButton(
                borderSideColor: Colors.grey.withOpacity(0.4),
                borderRadius: 12,
                backgroundColor: Colors.white,
                buttonText: 'Buy now',
                textStyle: TextStyles.font14BlackSemiBold,
                onPressed: () {},
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: isAddedToCart
                  ? AppTextButton(
                borderRadius: 12,
                backgroundColor: Colors.white,
                buttonText: 'Added to Cart',
                textStyle: TextStyles.font14BlackSemiBold.copyWith(
                  color: Colors.black,
                ),
                onPressed: () {},
              )
                  : AppTextButton(
                borderRadius: 12,
                backgroundColor: Colors.black,
                buttonText: 'Add To Cart',
                textStyle: TextStyles.font14BlackSemiBold.copyWith(
                  color: Colors.white,
                ),
                onPressed: () {
                  context.read<AddCartCubit>().AddCart(widget.id);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
