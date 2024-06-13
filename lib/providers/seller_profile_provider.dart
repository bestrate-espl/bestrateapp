
import 'package:bestrateapp/models/profile_update_model.dart';
import 'package:bestrateapp/models/seller_profile_model.dart';
import 'package:bestrateapp/request_models/profile_update_request_model.dart';
import 'package:bestrateapp/service/api_services.dart';
import 'package:bestrateapp/utils/show_toast.dart';
import 'package:flutter/cupertino.dart';

class SellerProfileProvider extends ChangeNotifier{
  SellerProfileModel? _sellerProfileModel;
  ProfileUpdateModel? _profileUpdateModel;
  bool _isLoading = false;

  SellerProfileModel? get sellerProfileModel => _sellerProfileModel;
  ProfileUpdateModel? get profileUpdateModel => _profileUpdateModel;
  bool get isLoading => _isLoading;


  Future<void> getSellerProfile(String token, int sellerId) async {
    _isLoading = true;
    notifyListeners();
    try{
      _sellerProfileModel = await ApiService.getSellerProfile(token, sellerId);
      if (_sellerProfileModel?.statusCode == 200 && _sellerProfileModel?.status == true){
          notifyListeners();
      }else{
        ShowToast.showToastError(_sellerProfileModel!.message.toString());
      }
    }catch(e){
      ShowToast.showToastError(e.toString());
    }finally{
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getProfileUpdate(String token, ProfileUpdateRequestModel updateRequestModel) async {
    _isLoading = true;
    notifyListeners();
    try{
      _profileUpdateModel = await ApiService.getProfileUpdate(token, updateRequestModel);
      if (_profileUpdateModel?.statusCode == 200 && _profileUpdateModel?.status == true){
        ShowToast.shoToastSuccess(_profileUpdateModel!.message.toString());
        notifyListeners();
      }else{
        ShowToast.showToastError(_profileUpdateModel!.message.toString());
      }
    }catch(e){
      ShowToast.showToastError(e.toString());
    }finally{
      _isLoading = false;
      notifyListeners();
    }
  }



}