import 'package:flutter/material.dart';

// Step 1: Create a ChangeNotifier class
class CheckboxProvider extends ChangeNotifier {
  bool _isChecked = false;

  bool get isChecked => _isChecked;

  void toggleCheckbox() {
    _isChecked = !_isChecked;
    notifyListeners(); // Notify listeners after updating the state
  }
}