import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickmart/core/networking/dio_consumer.dart';
import 'package:quickmart/core/theming/Styles.dart';
import 'package:quickmart/core/theming/colors.dart';
import 'package:quickmart/core/widgets/app_text_button.dart';
import 'package:expandable/expandable.dart';
import 'package:quickmart/core/widgets/star_rating.dart';
import 'package:quickmart/features/Product/data/cubit/add_cart_cubit.dart';
import 'package:quickmart/features/Product/ui/widgets/buy_add_to_card_buttons.dart';

class DetailedProduct extends StatefulWidget {
  DetailedProduct({
    super.key,
    required this.images,
    required this.name,
    required this.price,
    required this.id,
    required this.description, required this.rating,

  });

  final List<String> images;
  final String name;
  final double price;
  final double rating;
  final String id;
  final String description;

  @override
  State<DetailedProduct> createState() => _DetailedProductState();
}

class _DetailedProductState extends State<DetailedProduct> {
  int _selectedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 290.h,
            floating: false,
            pinned: true,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                widget.images[_selectedImageIndex], // Show selected image
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Horizontal list of images
                    SizedBox(
                      height: 80.h, // Set height for the image list
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.images.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedImageIndex =
                                    index; // Update selected image
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 4.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: _selectedImageIndex == index
                                      ? Colors.blue // Highlight selected image
                                      : Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Image.network(
                                widget.images[index],
                                width: 80.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Row(children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blue),
                        child: Center(
                            child: Text(
                              'Top Rated',
                              style: TextStyles.font12BlackMedium
                                  .copyWith(color: Colors.white),
                            )),
                        height: 32.h,
                        width: 84.w,
                      ),
                      SizedBox(width: 12.w,),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: ColorsManager.mainCyan),
                        child: Center(
                            child: Text(
                              'Free Shipping',
                              style: TextStyles.font12BlackMedium
                                  .copyWith(color: Colors.white),
                            )),
                        height: 32.h,
                        width: 100.w,
                      ),
                    ]),
                    SizedBox(height: 8.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget.name,
                            style: TextStyles.font24BlackBold,
                          ),
                        ),
                        SizedBox(width: 1.w),
                        Column(
                          children: [
                            Text(
                              '${widget.price} EGP',
                              style: TextStyles.font20BlackBold,
                            ),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    RatingWidget(
                      rating: widget.rating,
                    ),
                    Text(
                      'Description :-',
                      style: TextStyles.font20BlackBold
                          .copyWith(color: Colors.black.withOpacity(0.6)),
                    ),
                    SizedBox(height: 8.h),

                    ExpandableNotifier(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expandable(
                            collapsed: ExpandableButton(
                              child: Text(
                                widget.description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 8,
                                style: TextStyles.font18GrayRegular,
                              ),
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.description,
                                  style: TextStyles.font18GrayRegular,
                                ),
                                ExpandableButton(
                                  child: Text(
                                    'Show less',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    BlocProvider(
                      create: (context) => AddCartCubit(DioConsumer(dio: Dio())),
                      child: BuyBowButtons(id: widget.id,),
                    ),
                    // Add some padding at the bottom
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
