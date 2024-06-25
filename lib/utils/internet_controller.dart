import 'dart:async';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetController extends GetxController{
  bool isConnectedToInternet = false;
  StreamSubscription? _streamSubscription;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _streamSubscription = InternetConnection().onStatusChange.listen((event) {
      switch (event) {
        case InternetStatus.connected:
          print("Status : Internet Connected");
          isConnectedToInternet = true;
          update();
          break;
        case InternetStatus.disconnected:
          isConnectedToInternet = false;
          update();
          break;
        default:
          isConnectedToInternet = false;
          update();
          break;
      }
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();

  }
}