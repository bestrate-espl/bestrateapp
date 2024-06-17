import 'dart:developer';


import 'package:flutter/cupertino.dart';

import '../models/login_model.dart';
import '../models/verify_login_otp_model.dart';
import '../service/api_services.dart';

import '../sharedpreference/SharedPreferenceHelper.dart';
import '../utils/sharedpreference_constant.dart';
import '../utils/show_toast.dart';

class LoginProvider extends ChangeNotifier{
  LoginModel? _loginModel;
  bool _isLoading = false;
  VerifyLoginOtpModel? _verifyLoginOtpModel;


  LoginModel? get loginModel => _loginModel;
  VerifyLoginOtpModel? get verifyLoginOtpModel => _verifyLoginOtpModel;
  bool get isLoading => _isLoading;



  Future<void> getLogin(String mobileNo) async {
    _isLoading = true;
    notifyListeners();
    try{
      _loginModel = await ApiService.getLogin(mobileNo);
      if (_loginModel!.statusCode == 200 && _loginModel!.status == true){
        ShowToast.shoToastSuccess(_loginModel!.message.toString());
        SharedPreferenceHelper.saveData(SharedPreferenceConstant.USER_MOBILE, mobileNo);
        SharedPreferenceHelper.saveData(SharedPreferenceConstant.USER_LOGIN_OTP, loginModel!.otp.toString());
        log(_loginModel!.toJson().toString() ?? '', name: "Business List");
        notifyListeners();

      }else{
        ShowToast.showToastError(_loginModel!.message.toString());
      }
    }catch(e){
      ShowToast.showToastError(e.toString());
    } finally{
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getVerifyLoginOtp(String mobileNo, int otp) async {
    _isLoading = true;
    notifyListeners();
    try{
      _verifyLoginOtpModel = await ApiService.getVerifyLoginOtp(mobileNo, otp);
      if (_verifyLoginOtpModel!.statusCode == 200 && _verifyLoginOtpModel!.status == true){
        ShowToast.shoToastSuccess(_verifyLoginOtpModel!.message.toString());
        SharedPreferenceHelper.saveData(SharedPreferenceConstant.USER_ID, _verifyLoginOtpModel!.data!.userid.toString());
        SharedPreferenceHelper.saveData(SharedPreferenceConstant.USER_NAME, "${_verifyLoginOtpModel!.data!.firstName}${" "}${_verifyLoginOtpModel!.data!.lastName}");
        SharedPreferenceHelper.saveData(SharedPreferenceConstant.USER_EMAIL, _verifyLoginOtpModel!.data!.email.toString());
        SharedPreferenceHelper.saveData(SharedPreferenceConstant.USER_TOKEN, _verifyLoginOtpModel!.token.toString());
        SharedPreferenceHelper.saveData(SharedPreferenceConstant.BUYER_ID, _verifyLoginOtpModel!.data!.buyerId.toString());
        log(_verifyLoginOtpModel!.toJson().toString() ?? '', name: "Business List");
        notifyListeners();

      }else{
        ShowToast.showToastError(_verifyLoginOtpModel!.message.toString());
      }
    }catch(e){
      ShowToast.showToastError(e.toString());
    } finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}