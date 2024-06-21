import 'dart:developer';

import 'package:bestrateapp/models/verify_otp_model.dart';
import 'package:bestrateapp/models/verify_register_otp_model.dart';
import 'package:flutter/cupertino.dart';

import '../service/api_services.dart';
import '../sharedpreference/SharedPreferenceHelper.dart';
import '../sharedpreference/sharedpreference_constant.dart';
import '../utils/show_toast.dart';

class VerifyRegisterOtpProvider extends ChangeNotifier{
  VerifyOtpModel? _verifyOtpModel;
  bool _isLoading = false;

  VerifyOtpModel? get verifyOtpModel => _verifyOtpModel;

  bool get isLoading => _isLoading;

  Future<void> getVerifyRegisterOtp(String userId, int mobileOtp, int emailOtp) async{
    _isLoading = true;
    notifyListeners();
    try{
      _verifyOtpModel = await ApiService.getVerifyRegisterOtp(userId,mobileOtp,emailOtp);
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