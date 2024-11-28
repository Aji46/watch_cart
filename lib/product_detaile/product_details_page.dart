import 'package:bw2_cart/controller/provider/Quantity.dart';
import 'package:bw2_cart/controller/provider/checkbox.dart';
import 'package:bw2_cart/home/widgets/appbar.dart';
import 'package:bw2_cart/home/widgets/bottom_navbar.dart';
import 'package:bw2_cart/product_detaile/widget/Quantity_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;

  ProductDetailsPage({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GradientAppBar(),
      body: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Subtotal',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 20),
                  Consumer<QuantityProvider>(
                    builder: (context, quantityProvider, child) {
                      return Text(
                        '\$${quantityProvider.totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 5),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'EMI Available',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        const TextSpan(
                          text: 'Details',
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      children: [
                        const TextSpan(
                          text:
                              'Free Delivery Available. \nSelect this option to checkout.',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        TextSpan(
                          text: ' Details',
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add your checkout logic here
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Proceed to Buy (1 item)',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
              const Divider(),
              Row(
                children: [
                  Consumer<CheckboxProvider>(
                    builder: (context, checkboxProvider, child) {
                      return Checkbox(
                        value: checkboxProvider.isChecked,
                        onChanged: (bool? newValue) {
                          checkboxProvider.toggleCheckbox(newValue);
                        },
                      );
                    },
                  ),
                  const Text("Select all Items")
                ],
              ),
              Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Consumer<CheckboxProvider>(
                          builder: (context, checkboxProvider, child) {
                            return Checkbox(
                              value: checkboxProvider.isChecked,
                              onChanged: (bool? newValue) {
                                checkboxProvider.toggleCheckbox(newValue);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 45),
                        Center(
                          child: Image.network(
                            imageUrl,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Column(
                            children: [
                              Wrap(
                                children: [
                                  Text(
                                    title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                  ),
                                ],
                              ),
                              Consumer<QuantityProvider>(
                                builder: (context, quantityProvider, child) {
                                  return Text(
                                    '\$${quantityProvider.totalPrice.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 40),
                        const QuantityControl(),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Add your delete logic here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                  color: const Color.fromARGB(255, 0, 0, 0)!),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            minimumSize: const Size(60, 40),
                          ),
                          child: const Text(
                            'Delete',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Your onPressed logic here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            minimumSize: const Size(60, 40),
                          ),
                          child: const Text(
                            'Save for Later',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 5),
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Center(
                child: Text(
                  'See more like this',
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
