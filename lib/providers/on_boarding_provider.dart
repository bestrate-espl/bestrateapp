import 'package:flutter/cupertino.dart';

class OnBoardingProvider extends ChangeNotifier{
   late  PageController _controller;
  // keep track of if we are on the last page or not
  bool onLastPage = false;

  OnBoardingProvider(){
    _controller = PageController(keepPage: onLastPage);
    _controller.addListener(() {
      onLastPage = _controller.keepPage;
      notifyListeners();
    });
  }

  PageController get pageController => _controller;
}