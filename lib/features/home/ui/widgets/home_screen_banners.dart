// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:quickmart/features/home/Data/Cubit/home_cubit.dart';
//
// class HomeBanners extends StatelessWidget {
//   const HomeBanners({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeCubit, HomeState>(
//       listener: (context, state) {
//         if (state is HomeFaliure) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(state.errorMessage)),
//           );
//         }
//       },
//       builder: (context, state) {
//         if (state is HomeLoading) {
//           return Center(child: CircularProgressIndicator());
//         } else if (state is HomeFaliure) {
//           return Center(child: Text('Failed to load banners'));
//         } else if (state is HomeSuccess) {
//           return Row(
//             children: [
//               Expanded(
//                 child: SizedBox(
//                   height: 200, // Adjust height as needed
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: state.home.banners.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(16),
//                           child: Image.network(
//                             state.home.banners[index].image,
//                             width: 320.w, // Adjust width as needed
//                             fit: BoxFit.cover, // Ensure the image covers the rounded rectangle
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           );
//         } else {
//
//           return Center(child: Text('Welcome to QuickMart'));
//         }
//       },
//     );
//   }
// }
