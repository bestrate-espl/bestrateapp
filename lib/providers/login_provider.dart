import 'dart:developer';


import 'package:bestrateapp/models/verify_otp_model.dart';
import 'package:flutter/cupertino.dart';

import '../models/login_model.dart';
import '../models/verify_login_otp_model.dart';
import '../service/api_services.dart';

import '../sharedpreference/SharedPreferenceHelper.dart';
import '../sharedpreference/sharedpreference_constant.dart';
import '../utils/show_toast.dart';

class LoginProvider extends ChangeNotifier{
  LoginModel? _loginModel;
  VerifyOtpModel? _verifyOtpModel;
  bool _isLoading = false;


  LoginModel? get loginModel => _loginModel;
  VerifyOtpModel? get verifyOtpModel => _verifyOtpModel;
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
      _verifyOtpModel = await ApiService.getVerifyLoginOtp(mobileNo, otp);
      if (_verifyOtpModel!.statusCode == 200 && _verifyOtpModel!.status == true){
        ShowToast.shoToastSuccess(_verifyOtpModel!.message.toString());
        SharedPreferenceHelper.saveData(SharedPreferenceConstant.USER_ID, _verifyOtpModel!.data!.userid.toString());
        SharedPreferenceHelper.saveData(SharedPreferenceConstant.USER_NAME, "${_verifyOtpModel!.data!.firstName}${" "}${_verifyOtpModel!.data!.lastName}");
        SharedPreferenceHelper.saveData(SharedPreferenceConstant.USER_EMAIL, _verifyOtpModel!.data!.email.toString());
        SharedPreferenceHelper.saveData(SharedPreferenceConstant.USER_TOKEN, _verifyOtpModel!.token.toString());
        SharedPreferenceHelper.saveData(SharedPreferenceConstant.PROFILE_ID, _verifyOtpModel!.data!.profileId.toString());
        log(_verifyOtpModel!.toJson().toString() ?? '', name: "Business List");
        notifyListeners();

      }else{
        ShowToast.showToastError(_verifyOtpModel!.message.toString());
      }
    }catch(e){
      ShowToast.showToastError(e.toString());
    } finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}