
import 'package:bestrateapp/models/seller_keywods_model.dart';
import 'package:bestrateapp/service/api_services.dart';
import 'package:bestrateapp/utils/show_toast.dart';
import 'package:flutter/cupertino.dart';

class SellerKeywordsProviders extends ChangeNotifier{
  SellerKeywordsModel? _sellerKeywordsModel;
  bool _isLoading = false;

  SellerKeywordsModel? get sellerKeywordsModel => _sellerKeywordsModel;
  bool get isLoading => _isLoading;

  Future<void> getSellerKeywords(String token, int sellerId) async{
    _isLoading = true;
    notifyListeners();

    try{
      _sellerKeywordsModel = await ApiService.getSellerKeywords(token, sellerId);
      if (_sellerKeywordsModel!.statusCode == 200 && _sellerKeywordsModel!.status == true){
          notifyListeners();
      }else{
        ShowToast.showToastError(_sellerKeywordsModel!.message.toString());
      }
    }catch(e){
      ShowToast.showToastError(e.toString());
    }finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}