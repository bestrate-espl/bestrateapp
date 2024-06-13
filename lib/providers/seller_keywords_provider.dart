
import 'package:bestrateapp/models/add_seller_keyword.dart';
import 'package:bestrateapp/models/delete_seller_keyword.dart';
import 'package:bestrateapp/models/seller_keywods_model.dart';
import 'package:bestrateapp/models/seller_request_keyword_model.dart';
import 'package:bestrateapp/service/api_services.dart';
import 'package:bestrateapp/utils/show_toast.dart';
import 'package:flutter/cupertino.dart';

class SellerKeywordsProviders extends ChangeNotifier{
  SellerKeywordsModel? _sellerKeywordsModel;
  SellerRequestKeywordModel? _requestKeywordModel;
  AddSellerKeywordModel? _addSellerKeywordModel;
  DeleteSellerKeywordModel? _deleteSellerKeywordModel;
  bool _isLoading = false;

  SellerKeywordsModel? get sellerKeywordsModel => _sellerKeywordsModel;
  SellerRequestKeywordModel? get requestKeywordModel => _requestKeywordModel;
  AddSellerKeywordModel? get addSellerKeywordModel => _addSellerKeywordModel;
  DeleteSellerKeywordModel? get deleteSellerKeywordModel => _deleteSellerKeywordModel;
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


  Future<void> getSellerRequestKeywords(String token, int sellerId, String keyword) async{
    _isLoading = true;
    notifyListeners();

    try{
      _requestKeywordModel = await ApiService.getSellerRequestKeyword(token, sellerId, keyword);
      if (_requestKeywordModel!.statusCode == 200 && _requestKeywordModel!.status == true){
        notifyListeners();
      }else{
        ShowToast.showToastError(_requestKeywordModel!.message.toString());
      }
    }catch(e){
      ShowToast.showToastError(e.toString());
    }finally{
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getAddSellerKeyword(String token, int sellerId, int keywordId) async{
    _isLoading = true;
    notifyListeners();

    try{
      _addSellerKeywordModel = await ApiService.getAddSellerKeyword(token, sellerId, keywordId);
      if (_addSellerKeywordModel!.statusCode == 200 && _addSellerKeywordModel!.status == true){
        ShowToast.shoToastSuccess(_addSellerKeywordModel!.message.toString());
        notifyListeners();
      }else{
        ShowToast.showToastError(_addSellerKeywordModel!.message.toString());
      }
    }catch(e){
      ShowToast.showToastError(e.toString());
    }finally{
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getDeleteSellerKeyword(String token, int sellerKeywordId) async{
    _isLoading = true;
    notifyListeners();

    try{
      _deleteSellerKeywordModel = await ApiService.getDeleteSellerKeyword(token, sellerKeywordId);
      if (_deleteSellerKeywordModel!.statusCode == 200 && _deleteSellerKeywordModel!.status == true){
        ShowToast.shoToastSuccess(_deleteSellerKeywordModel!.message.toString());
        notifyListeners();
      }else{
        ShowToast.showToastError(_deleteSellerKeywordModel!.message.toString());
      }
    }catch(e){
      ShowToast.showToastError(e.toString());
    }finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}