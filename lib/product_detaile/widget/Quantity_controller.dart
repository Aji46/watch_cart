import 'package:bw2_cart/controller/provider/Quantity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuantityControl extends StatelessWidget {
  const QuantityControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Qty:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 5),
        SizedBox(
          child: Row(
            children: [
              Consumer<QuantityProvider>(
                builder: (context, quantityProvider, child) {
                  return ElevatedButton(
                    onPressed: () {
                      quantityProvider.decrement();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide(color: Colors.grey[300]!),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12.0),
                      minimumSize: const Size(30, 30),
                    ),
                    child: const Text(
                      '-',
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.w900),
                    ),
                  );
                },
              ),
              const SizedBox(width: 5),
              Consumer<QuantityProvider>(
                builder: (context, quantityProvider, child) {
                  return Text(
                    '${quantityProvider.quantity}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w900),
                  );
                },
              ),
              const SizedBox(width: 5),
              Consumer<QuantityProvider>(
                builder: (context, quantityProvider, child) {
                  return ElevatedButton(
                    onPressed: () {
                      quantityProvider.increment();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                        side: BorderSide(color: Colors.grey[300]!),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12.0),
                      minimumSize: const Size(30, 30),
                    ),
                    child: const Text(
                      '+',
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.w900),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
