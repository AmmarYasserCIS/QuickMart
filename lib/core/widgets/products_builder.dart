import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickmart/features/Product/ui/product.dart';
import 'package:quickmart/features/home/Data/Model/home_model.dart';
import 'package:quickmart/features/home/ui/widgets/ProductsCard.dart';

class ProductsBuilder extends StatefulWidget {
  final int itemCount;
  final String Function(int) getName;
  final double Function(int) getPrice;
  final double Function(int) ratingsAverage;
  final String Function(int) getImage;
  final List<String> Function(int) getImages;
  final String Function(int) getId;
  final String Function(int) getDescription;

  const ProductsBuilder({
    Key? key,
    required this.itemCount,
    required this.getName,
    required this.getPrice,
    required this.getImage,
    required this.getImages,
    required this.getId,
    required this.getDescription,
    required this.ratingsAverage,
  }) : super(key: key);

  @override
  _ProductsBuilderState createState() => _ProductsBuilderState();
}

class _ProductsBuilderState extends State<ProductsBuilder> {
  late List<bool> wishlistStatus;

  @override
  void initState() {
    super.initState();
    wishlistStatus = List<bool>.filled(widget.itemCount, false);
  }

  void toggleWishlistStatus(int index) {
    setState(() {
      wishlistStatus[index] = !wishlistStatus[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width - 32.w,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 16.h,
        ),
        itemCount: widget.itemCount,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailedProduct(
                    price: widget.getPrice(index),
                    name: widget.getName(index),
                    id: widget.getId(index),
                    description: widget.getDescription(index),
                    images: widget.getImages(index),
                    rating: widget.ratingsAverage(index),
                  ),
                ),
              );
            },
            child: ProductCard(
              price: widget.getPrice(index),
              name: widget.getName(index),
              image: widget.getImage(index),
              id: widget.getId(index),
              isInWishlist: wishlistStatus[index],
              onWishlistToggle: () => toggleWishlistStatus(index),
            ),
          );
        },
      ),
    );
  }
}
