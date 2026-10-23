import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grabber_grocery_store/core/app_colors.dart';
import 'package:grabber_grocery_store/features/home/models/category_model.dart';
import 'package:grabber_grocery_store/features/home/models/product_model.dart';
import 'package:grabber_grocery_store/features/home/widgets/category_card.dart';
import 'package:grabber_grocery_store/features/home/widgets/product_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> banners = [
    'assets/banners/Slider 1.png',
    'assets/banners/Slider 2.png',
    'assets/banners/Slider 3.png',
  ];
  List<CategoryModel> categories = [
    CategoryModel(title: 'Fruites', imagePath: 'assets/category/friutes.png'),
    CategoryModel(title: 'Milk & egg', imagePath: 'assets/category/egg.png'),
    CategoryModel(
      title: 'Beverages',
      imagePath: 'assets/category/beverages.png',
    ),
    CategoryModel(title: 'Lundary', imagePath: 'assets/category/lundary.png'),
    CategoryModel(
      title: 'Vegatables',
      imagePath: 'assets/category/vegatables.png',
    ),
  ];
  List<ProductModel> products = [
    ProductModel(
      title: 'Banana',
      imagePath: 'assets/fruites/banana.png',
      rate: 4.8,
      reviewsCount: (287),
      price: 3.99,
    ),
    ProductModel(
      title: 'Pepper',
      imagePath: 'assets/fruites/papper.png',
      rate: 4.8,
      reviewsCount: (287),
      price: 2.99,
    ),
    ProductModel(
      title: 'Orange',
      imagePath: 'assets/fruites/orange.png',
      rate: 4.8,
      reviewsCount: (287),
      price: 3.99,
    ),
    ProductModel(
      title: 'Orange',
      imagePath: 'assets/category/egg.png',
      rate: 4.8,
      reviewsCount: (287),
      price: 3.99,
    ),
    ProductModel(
      title: 'Orange',
      imagePath: 'assets/category/vegatables.png',
      rate: 4.8,
      reviewsCount: (287),
      price: 3.99,
    ),
  ];
  List basketList = [];
  void toggle(ProductModel product) {
    setState(() {
      if (basketList.contains(product)) {
        basketList.remove(product);
      } else {
        basketList.add(product);
      }
    });
  }

  bool isSelected(ProductModel product) => basketList.contains(product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.shrink(),
        leadingWidth: 0,
        title: Row(
          children: [
            SvgPicture.asset('assets/icons/motorcycle.svg'),
            SizedBox(width: 10),
            Text(
              '61 Hopper street..',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
            ),
            SizedBox(width: 10),
            Icon(Icons.keyboard_arrow_down_outlined, size: 32),
            Spacer(),
            SvgPicture.asset('assets/icons/basket.svg'),
          ],
        ),
      ),
      body: Column(
        children: [
          // banner
          CarouselSlider.builder(
            itemCount: banners.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
                  return Image.asset(banners[itemIndex]);
                },
            options: CarouselOptions(
              height: 170,
              aspectRatio: 1,
              viewportFraction: 0.6,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(seconds: 3),
              autoPlayCurve: Curves.linear,
              enlargeCenterPage: true,
            ),
          ),

          // category
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(categories.length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CategoryCard(categoryModel: categories[index]),
                );
              }),
            ),
          ),

          // Fruites Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Fruites',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: List.generate(products.length, (index) {
                  final item = products[index];
                  return ProductCard(
                    productModel: item,
                    onPressed: () => toggle(item),
                    icon: Icon(isSelected(item) ? Icons.delete : Icons.add),
                  );
                }),
              ),
            ),
          ),
          Spacer(),
          // cart widget
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              width: double.infinity,
              height: 77,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    SizedBox(
                      width: 165,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: basketList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(basketList[index].imagePath),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Spacer(),
                    Container(width: 2, height: 40, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      'View Basket',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(width: 10),
                    Badge(
                      backgroundColor: Colors.red,
                      label: Text(
                        basketList.length.toString(),
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/basket.svg',
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}
