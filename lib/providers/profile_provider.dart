import 'package:bestrateapp/models/profile_model.dart';
import 'package:bestrateapp/models/update_profile_model.dart';
import 'package:bestrateapp/request_models/request_update_profile_model.dart';
import 'package:bestrateapp/service/api_services.dart';
import 'package:bestrateapp/utils/show_toast.dart';
import 'package:flutter/cupertino.dart';

class ProfileProvider extends ChangeNotifier{
  ProfileModel? _profileModel;
  UpdateProfileModel? _updateProfileModel;
  bool _isLoading = false;

  ProfileModel? get profileModel => _profileModel;

  UpdateProfileModel? get updateProfileModel => _updateProfileModel;

  bool get isLoading => _isLoading;

  Future<void> getProfile (String token, int buyerId) async{
    _isLoading = true;
    notifyListeners();
    try{
      _profileModel = await ApiService.getProfile(token, buyerId);
      if (_profileModel!.statusCode == 200 && _profileModel!.status == true){
         notifyListeners();
      }else{
        ShowToast.showToastError(_profileModel!.message.toString());
      }
    }catch(e){
      ShowToast.showToastError(e.toString());
    }finally{
      _isLoading = false;
      notifyListeners();
    }

  }

  Future<void> getUpdateProfile (String token, RequestUpdateProfileModel requestUpdateProfile) async{
    _isLoading = true;
    notifyListeners();
    try{
      _updateProfileModel = await ApiService.getUpdateProfile(token, requestUpdateProfile);
      if (_updateProfileModel!.statusCode == 200 && _updateProfileModel!.status == true){
        ShowToast.shoToastSuccess(_updateProfileModel!.message.toString());
        notifyListeners();
      }else{
        ShowToast.showToastError(_updateProfileModel!.message.toString());
      }
    }catch(e){
      ShowToast.showToastError(e.toString());
    }finally{
      _isLoading = false;
      notifyListeners();
    }

  }
}