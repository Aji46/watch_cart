import 'package:bw2_cart/controller/provider/like_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProductDialog {
  ProductDialog(BuildContext context, Map<String, String> product) {
    int quantity = 1;
    bool isLiked = false;

    showDialog(
      context: context,
      builder: (context) {
        isLiked = Provider.of<LikedProductsProvider>(context, listen: false)
            .isLiked(product['id']!);
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  gradient: const RadialGradient(
                    center: Alignment.bottomLeft,
                    radius: 1.2,
                    colors: [
                      Color.fromARGB(255, 20, 171, 191),
                      Color.fromARGB(255, 151, 244, 64),
                    ],
                    stops: [0.5, 1.0],
                  ),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 20),
                                child: ClipRRect(
                                  child: Image.network(
                                    product['imageUrl'] ?? '',
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(Icons.image,
                                                color: Colors.grey),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 20),
                                child: ClipRRect(
                                  child: Image.network(
                                    product['imageUrl'] ?? '',
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(Icons.image,
                                                color: Colors.grey),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 20),
                                child: ClipRRect(
                                  child: Image.network(
                                    product['imageUrl'] ?? '',
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(Icons.image,
                                                color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 27, 128, 142),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: const Text(
                                        'Best Seller',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      isLiked
                                          ? Icons.favorite
                                          : Icons
                                              .favorite,
                                      color: isLiked
                                          ? Colors.red
                                          : Colors
                                              .grey,
                                    ),
                                    onPressed: () async {
                                      await Provider.of<LikedProductsProvider>(
                                              context,
                                              listen: false)
                                          .toggleLike({
                                        'id': product['id'] ?? '',
                                        'imageUrl': product['imageUrl'] ?? '',
                                        'title': product['title'] ?? '',
                                      }); 
                                      setState(() {
                                        isLiked =
                                            !isLiked;
                                      });
                                    },
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                      gradient: const RadialGradient(
                                        center: Alignment.bottomLeft,
                                        radius: 1.2,
                                        colors: [
                                          Color.fromARGB(255, 20, 171, 191),
                                          Color.fromARGB(255, 151, 244, 64),
                                        ],
                                        stops: [0.5, 1.0],
                                      ),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(60),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.close),
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    product['imageUrl'] ?? '',
                                    height: 200,
                                    width: 200,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(Icons.image, size: 200),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        product['title'] ?? 'Product Title',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 190,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop();
                            context.go('/ProductDetailsPage', extra: product);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                              side: BorderSide(color: Colors.grey[300]!),
                            ),
                          ),
                          child: const Text(
                            'See all Details',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 40,
                        width: 190,
                        decoration: BoxDecoration(
                          gradient: const RadialGradient(
                            center: Alignment.bottomLeft,
                            radius: 3.2,
                            colors: [
                              Color.fromARGB(255, 255, 187, 0),
                              Color.fromARGB(255, 255, 98, 0),
                            ],
                            stops: [0.5, 1.0],
                          ),
                          border: Border.all(color: Colors.black, width: 1.0),
                        ),
                        child: Center(
                          child: Text(
                            '\$${product['price'] ?? '99.00'}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Qty:',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 16),
                          SizedBox(
                            child: Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (quantity > 1) {
                                      setState(() => quantity--);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[200],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                      side:
                                          BorderSide(color: Colors.grey[300]!),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 12.0),
                                    minimumSize: const Size(36, 36),
                                  ),
                                  child: const Text(
                                    '-',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  '$quantity',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900),
                                ),
                                const SizedBox(width: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() => quantity++);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[200],
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                      side:
                                          BorderSide(color: Colors.grey[300]!),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 12.0),
                                    minimumSize: const Size(36, 36),
                                  ),
                                  child: const Text(
                                    '+',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
