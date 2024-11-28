import 'package:flutter/material.dart';

class CheckboxProvider extends ChangeNotifier {
  bool _isChecked = false; // Initial value

  bool get isChecked => _isChecked;

  void toggleCheckbox(bool? newValue) {
    _isChecked = newValue ?? false;
    notifyListeners(); // Notify listeners about the change
  }
}
