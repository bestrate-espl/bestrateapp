
import 'package:bestrateapp/models/seller_profile_model.dart';
import 'package:bestrateapp/request_models/profile_update_request_model.dart';
import 'package:bestrateapp/service/api_services.dart';
import 'package:bestrateapp/utils/show_toast.dart';
import 'package:flutter/cupertino.dart';

class SellerProfileProvider extends ChangeNotifier{
  SellerProfileModel? _sellerProfileModel;

  bool _isLoading = false;

  SellerProfileModel? get sellerProfileModel => _sellerProfileModel;
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


}