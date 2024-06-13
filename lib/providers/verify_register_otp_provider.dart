import 'dart:developer';

import 'package:bestrateapp/models/verify_register_otp_model.dart';
import 'package:flutter/cupertino.dart';

import '../service/api_services.dart';
import '../sharedpreference/SharedPreferenceHelper.dart';
import '../utils/sharedpreference_constant.dart';
import '../utils/show_toast.dart';

class VerifyRegisterOtpProvider extends ChangeNotifier{
  VerifyRegisterOtpModel? _verifyRegisterOtpModel;
  bool _isLoading = false;

  VerifyRegisterOtpModel? get verifyRegisterOtpModel => _verifyRegisterOtpModel;

  bool get isLoading => _isLoading;

  Future<void> getVerifyRegisterOtp(String userId, int mobileOtp, int emailOtp) async{
    _isLoading = true;
    notifyListeners();
    try{
      _verifyRegisterOtpModel = await ApiService.getVerifyRegisterOtp(userId,mobileOtp,emailOtp);
      if (_verifyRegisterOtpModel!.statusCode == 200 && _verifyRegisterOtpModel!.status == true){
        ShowToast.shoToastSuccess(_verifyRegisterOtpModel!.message.toString());
        SharedPreferenceHelper.saveData(SharedPreferenceConstant.USER_ID, _verifyRegisterOtpModel!.data!.userid.toString());
        SharedPreferenceHelper.saveData(SharedPreferenceConstant.USER_NAME, "${_verifyRegisterOtpModel!.data!.firstName}${" "}${_verifyRegisterOtpModel!.data!.lastName}");
        SharedPreferenceHelper.saveData(SharedPreferenceConstant.USER_EMAIL, _verifyRegisterOtpModel!.data!.email.toString());
        SharedPreferenceHelper.saveData(SharedPreferenceConstant.USER_TOKEN, _verifyRegisterOtpModel!.token.toString());
        SharedPreferenceHelper.saveData(SharedPreferenceConstant.SELLER_ID, _verifyRegisterOtpModel!.data!.sellerId.toString());
          log(_verifyRegisterOtpModel!.toJson().toString() ?? '', name: "Business List");
          notifyListeners();
      }else{
        ShowToast.showToastError(_verifyRegisterOtpModel!.message.toString());
      }
    }catch(e){
      ShowToast.showToastError(e.toString());
    } finally{
      _isLoading = false;
      notifyListeners();
    }

  }
}