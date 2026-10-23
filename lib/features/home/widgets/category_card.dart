import 'package:flutter/material.dart';
import 'package:grabber_grocery_store/features/home/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.grey.shade200,
          child: Center(
            child: Image.asset(height: 50, width: 54, categoryModel.imagePath),
          ),
        ),
        SizedBox(height: 20),
        Text(
          categoryModel.title,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
