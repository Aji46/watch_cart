import 'package:bw2_cart/controller/provider/like_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final String discountText;
  final String off;
  final bool isFirstCard;

  const ProductCard({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.discountText,
    required this.off,
    this.isFirstCard = false,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<LikedProductsProvider>(
      builder: (context, likedProductsProvider, child) {
        final isLiked = likedProductsProvider.isLiked(id);
        return Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      height: 150,
                      width: double.infinity,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Center(child: Icon(Icons.error));
                      },
                    ),
                  ),
                  if (isFirstCard)
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        color: const Color.fromARGB(255, 22, 155, 179),
                        child: const Text('Best Seller',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                      ),
                    ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite,
                        color: isLiked
                            ? Colors.red
                            : const Color.fromARGB(255, 134, 134, 134),
                      ),
                      onPressed: () {
                        likedProductsProvider.toggleLike({
                          'id': id,
                          'imageUrl': imageUrl,
                          'title': title,
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: const BoxDecoration(color: Colors.red),
                        child: Text(off,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255)))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: discountText.substring(
                                0, discountText.lastIndexOf(' ')),
                            style: const TextStyle(color: Colors.red),
                          ),
                          TextSpan(
                            text:
                                '\n${discountText.substring(discountText.lastIndexOf(' ') + 1)}',
                            style: const TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
