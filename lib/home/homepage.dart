import 'package:bw2_cart/home/widgets/appbar.dart';
import 'package:bw2_cart/home/widgets/product_cart.dart';
import 'package:bw2_cart/home/widgets/product_dilog.dart';
import 'package:flutter/material.dart';

import 'widgets/bottom_navbar.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      "id": "1",
      "imageUrl": "https://rukminim2.flixcart.com/image/720/864/xif0q/watch/p/s/w/-original-imagptuz423nuwur.jpeg?q=60&crop=false",
      "title": "Bronson Analog Watch - For Men FS5852",
      "off": "50% off",
      "discountText": "Deal of the Day",
      "isFirstCard": "true",
    },
    {
      "id": "2",
      "imageUrl": "https://img.tatacliq.com/images/i8/658Wx734H/MP000000014438152_658Wx734H_202209131840061.jpeg",
      "title": "Bronson Analog Watch - For Men FS5852",
      "off": "50% off",
      "discountText": "Deal of the Day",
    },
    {
      "id": "3",
      "imageUrl": "https://5.imimg.com/data5/SELLER/Default/2024/3/396917484/GU/BU/PC/30207760/fossil-everett-modern-machine-automatic-watch-500x500.jpeg",
      "title": "Bronson Analog Watch - For Men FS5852",
      "off": "50% off",
      "discountText": "Deal of the Day",
    },
    {
      "id": "4",
      "imageUrl": "https://img02.watchstationindia.com/uploads/masterwsi/dealimages/6380/mediumimages/fs58513p1.jpg",
      "title": "Bronson Analog Watch - For Men FS5852",
      "off": "50% off",
      "discountText": "Deal of the Day",
    },
    {
      "id": "5",
      "imageUrl": "https://i.ebayimg.com/images/g/N0gAAOSwhlZYtr-W/s-l500.jpg",
      "title": "Bronson Analog Watch - For Men FS5852",
      "off": "50% off",
      "discountText": "Deal of the Day",
    },
    {
      "id": "6",
      "imageUrl": "https://img02.watchstationindia.com/uploads/masterwsi/dealimages/6645/mediumimages/fs58783p1.jpg",
      "title": "Bronson Analog Watch - For Men FS5852",
      "off": "50% off",
      "discountText": "Deal of the Day",
    },
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GradientAppBar(),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 5,
              mainAxisSpacing: 4,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {
                  final ProductDialog dialog = ProductDialog(context, product);
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: const Color.fromARGB(255, 168, 184, 208),
                  child: ProductCard(
                    id: product['id'] ?? '',
                    imageUrl: product['imageUrl'] ?? '',
                    title: product['title'] ?? '',
                    discountText: product['discountText'] ?? '',
                    off: product['off'] ?? '',
                    isFirstCard: product['isFirstCard'] == "true",
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavbar()
    );
  }
}