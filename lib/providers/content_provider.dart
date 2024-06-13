import 'package:flutter/cupertino.dart';

class ContentProvider extends ChangeNotifier {
  bool _showWidget = true;

  bool get showWidget => _showWidget;

  void toggleWidget() {
    _showWidget = !_showWidget;
    notifyListeners();
  }
}