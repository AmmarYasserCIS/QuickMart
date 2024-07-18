import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickmart/features/category_products/data/cubit/category_products_cubit.dart';
import 'package:quickmart/features/category_products/ui/widgets/category_products_builder.dart';


class CategoryProductsScreen extends StatefulWidget {
  final String categoryValue;
  final String categoryName;

  const CategoryProductsScreen({Key? key, required this.categoryValue, required this.categoryName}) : super(key: key);

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
      appBar: AppBar(
        title: Text('${widget.categoryName}'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: CategoryProductsBuilder(),
        ),
      ),
    );
  }
}
