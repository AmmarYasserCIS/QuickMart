import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final double rating;

  RatingWidget({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating) {
          return Icon(Icons.star, color: Colors.amber);
        } else if (index == rating.floor() && rating % 1 != 0) {
          return Icon(Icons.star_half, color: Colors.amber);
        } else {
          return Icon(Icons.star_border, color: Colors.amber);
        }
      }),
    );
  }
}
