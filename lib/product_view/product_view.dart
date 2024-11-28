import 'package:bw2_cart/controller/provider/like_provider.dart';
import 'package:bw2_cart/home/widgets/appbar.dart';
import 'package:bw2_cart/home/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LikedProductsPage extends StatelessWidget {
  const LikedProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      const GradientAppBar(),
      body: Consumer<LikedProductsProvider>(
        builder: (context, likedProductsProvider, child) {
          final likedProducts = likedProductsProvider.likedProducts;

          if (likedProducts.isEmpty) {
            return const Center(
              child: Text('No favorite products yet'),
            );
          }

          return ListView.builder(
            itemCount: likedProducts.length,
            itemBuilder: (context, index) {
              final product = likedProducts[index];
              return ListTile(
                leading: Image.network(
                  product['imageUrl'],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(product['title']),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    likedProductsProvider.toggleLike(product);
                  },
                ),
               onTap: () {
  context.go(
    '/product/${product['id']}', 
    extra: {
      'id': product['id'],
      'imageUrl': product['imageUrl'],
      'title': product['title'],
    },
  );
}

              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavbar()
    );
  }
}
