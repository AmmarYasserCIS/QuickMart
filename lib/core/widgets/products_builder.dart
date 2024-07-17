import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quickmart/features/Product/ui/product.dart';
import 'package:quickmart/features/home/Data/Model/home_model.dart';
import 'package:quickmart/features/home/ui/widgets/ProductsCard.dart';

class ProductsBuilder extends StatelessWidget {
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
    required this.getDescription, required this.ratingsAverage,
  }) : super(key: key);

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
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailedProduct(
                    price: getPrice(index),
                    name: getName(index),
                    id: getId(index),
                    description: getDescription(index),
                    images: getImages(index), rating: ratingsAverage(index),
                  ),
                ),
              );
            },
            child: ProductCard(
              price: getPrice(index),
              name: getName(index),
              image: getImage(index),
            ),
          );
        },
      ),
    );
  }
}
