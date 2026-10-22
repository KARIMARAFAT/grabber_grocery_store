import 'package:flutter/material.dart';
import 'package:grabber_grocery_store/features/home/view/home_view.dart';
import 'package:grabber_grocery_store/features/splash/splash_view.dart';

void main() {
  runApp(const GroceryStoreApp());
}

class GroceryStoreApp extends StatelessWidget {
  const GroceryStoreApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery Store',
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
