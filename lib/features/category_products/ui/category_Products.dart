import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickmart/features/category_products/data/cubit/category_products_cubit.dart';
import 'package:quickmart/features/category_products/ui/widgets/category_products.dart';


class CategoryProductsScreen extends StatefulWidget {
  final String categoryValue;

  const CategoryProductsScreen({Key? key, required this.categoryValue}) : super(key: key);

  @override
  _CategoryProductsScreenState createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CategoryProductsCubit>(context).getProductsData(widget.categoryValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: CategoryProductsBuilder(),
        ),
      ),
    );
  }
}
