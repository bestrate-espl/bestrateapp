import 'dart:developer';
import 'package:bestrateapp/models/register_model.dart';
import 'package:bestrateapp/request_models/register_request_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/api_services.dart';
import '../utils/show_toast.dart';

class RegistrationProvider extends ChangeNotifier{
  RegisterModel? _registerModel;
  bool _isLoading = false;
  RegisterRequestModel _requestModel = RegisterRequestModel();

  RegisterRequestModel get requestModel => _requestModel;

  RegisterModel? get registerModel => _registerModel;

  bool get isLoading => _isLoading;

  Future<void> getRegister() async {
    _isLoading = true;
    notifyListeners();
    try{
      _registerModel = await ApiService.getRegister(_requestModel);
      if (_registerModel!.statusCode == 200 && _registerModel!.status == true){
          ShowToast.shoToastSuccess(_registerModel!.message.toString());
          log(_registerModel!.toJson().toString() ?? '', name: "Business List");
          notifyListeners();

      }else{
        ShowToast.showToastError(_registerModel!.message.toString());
      }
    }catch(e){
      ShowToast.showToastError(e.toString());
    } finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}