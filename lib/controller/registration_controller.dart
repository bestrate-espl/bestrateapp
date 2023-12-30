import 'package:get/get.dart';

class RegistrationController extends GetxController{
  int selectedPage = 0;

  void updateRegistrationPage(int currentIndex){
    selectedPage = currentIndex;
    update();
  }
}