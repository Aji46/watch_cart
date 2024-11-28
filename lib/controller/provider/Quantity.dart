import 'package:flutter/material.dart';

class QuantityProvider extends ChangeNotifier {
  int _quantity = 1; // Default quantity
  final double _unitPrice = 99.00; // Set your unit price

  int get quantity => _quantity;
  double get totalPrice => _quantity * _unitPrice;

  void increment() {
    _quantity++;
    notifyListeners();
  }

  void decrement() {
    if (_quantity > 1) {
      _quantity--;
      notifyListeners();
    }
  }
}
