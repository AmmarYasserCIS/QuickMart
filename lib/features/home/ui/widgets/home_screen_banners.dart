import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBanners extends StatelessWidget {
  const HomeBanners({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 200, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
                      width: 320.w, // Adjust width as needed
                      fit: BoxFit.cover, // Ensure the image covers the rounded rectangle
                    ),
                  ),
                );

              },
            ),
          ),
        ),
      ],
    );
  }
}
