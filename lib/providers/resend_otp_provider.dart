import 'package:bestrateapp/models/resend_otp_model.dart';
import 'package:bestrateapp/service/api_services.dart';
import 'package:bestrateapp/utils/show_toast.dart';
import 'package:flutter/cupertino.dart';

class ResendOtpProvider extends ChangeNotifier{
  ResendOtpModel? _resendOtpModel;
  bool _isLoading = false;

  ResendOtpModel? get resendOtpModel => _resendOtpModel;

  bool get isLoading => _isLoading;


  Future<void> getResendOtpMobile(int mobile) async{
    _isLoading = true;
    notifyListeners();
    try{
      _resendOtpModel = await ApiService.getResendOtpMobile(mobile);
      if (_resendOtpModel!.statusCode == 200 && _resendOtpModel!.status == true){
          ShowToast.shoToastSuccess(_resendOtpModel!.message.toString());
          notifyListeners();
      }else{
        ShowToast.showToastError(_resendOtpModel!.message.toString());
      }
    }catch(e){
      ShowToast.showToastError(e.toString());
    }finally{
      _isLoading = false;
      notifyListeners();
    }
  }


  Future<void> getResendOtpEmail(String email) async{
    _isLoading = true;
    notifyListeners();
    try{
      _resendOtpModel = await ApiService.getResendOtpEmail(email);
      if (_resendOtpModel!.statusCode == 200 && _resendOtpModel!.status == true){
        ShowToast.shoToastSuccess(_resendOtpModel!.message.toString());
        notifyListeners();
      }else{
        ShowToast.showToastError(_resendOtpModel!.message.toString());
      }
    }catch(e){
      ShowToast.showToastError(e.toString());
    }finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}