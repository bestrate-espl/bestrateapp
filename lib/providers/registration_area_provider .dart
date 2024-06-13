import 'dart:developer';

import 'package:bestrateapp/models/area_model.dart';
import 'package:bestrateapp/utils/show_toast.dart';
import 'package:flutter/material.dart';

import '../service/api_services.dart';

class RegistrationAreaProvider extends ChangeNotifier {
  AreaModel? _areaData;
  bool _isLoading = false;


  AreaModel? get areaData => _areaData;
  bool get isLoading => _isLoading;

  Future<void> getArea() async {
    _isLoading = true;
    notifyListeners();
    try {
      _areaData = await ApiService.getArea();
      if (_areaData?.statusCode == 200){
        if (_areaData!.data != null){
          // ShowToast.shoToastSuccess(_areaData!.status.toString());
          notifyListeners();
          log(_areaData!.toJson().toString() ?? '', name: "Area List");
        }else{
          ShowToast.showToastError("No data found");
        }
      }else{
        ShowToast.showToastError(_areaData!.status.toString());
      }

    } catch (error) {
      log('Error: $error', name: "Area List");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

