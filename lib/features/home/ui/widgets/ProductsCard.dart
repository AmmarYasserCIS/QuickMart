import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickmart/core/theming/Styles.dart';
import 'package:quickmart/features/wishlist/data/cubti/wishlist_cubit.dart';

class ProductCard extends StatefulWidget {
  final String name;
  final double price;
  final String image;
  final String id;
  final bool isInWishlist;
  final VoidCallback onWishlistToggle;

  ProductCard({
    required this.name,
    required this.price,
    required this.image,
    required this.id,
    required this.isInWishlist,
    required this.onWishlistToggle,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistCubit, WishlistState>(
      listener: (context, state) {
        if (state is AddWishlistSuccess || state is DeleteWishlistSuccess) {
          // Optionally handle success states
        }
      },
      builder: (context, state) {
        return Container(
          width: 140.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: 140.h,
                      ),
                      child: Image.network(
                        widget.image,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: InkWell(
                        onTap: () {
                          widget.onWishlistToggle();
                          if (widget.isInWishlist) {
                            BlocProvider.of<WishlistCubit>(context)
                                .deleteWishlistItem(widget.id);
                          } else {
                            BlocProvider.of<WishlistCubit>(context)
                                .addWishlist(widget.id);
                          }
                        },
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              widget.isInWishlist
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                widget.name,
                style: TextStyles.font14BlackSemiBold.copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                "${widget.price} EGP",
                style: TextStyles.font14BlackSemiBold.copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
