
import 'dart:developer';


import 'package:bestrateapp/models/search_business_model.dart';
import 'package:bestrateapp/models/store_search_business_data.dart';
import 'package:bestrateapp/service/api_services.dart';
import 'package:bestrateapp/utils/show_toast.dart';
import 'package:flutter/cupertino.dart';

class SearchBusinessProvider extends ChangeNotifier{
  SearchBusinessModel? _businessModel;
  bool _isLoading = false;
  List<String?> getBusinessName = [];
  final List<int?> getBusinessIds = [];


  SearchBusinessModel? get businessModel => _businessModel;
  bool get isLoading => _isLoading;


  Future<void> getSearchBusiness(String searchKey) async{
    _isLoading = true;
    notifyListeners();
    try{
      _businessModel = await ApiService.getBusiness(searchKey);
      if (_businessModel!.statusCode == 200){
        if (_businessModel!.matchedKeywords != null){
          log(_businessModel!.toJson().toString() ?? '', name: "Business List");
          notifyListeners();
        }else{
          ShowToast.showToastError(_businessModel!.status.toString());
        }
      }else{
        ShowToast.showToastError(_businessModel!.status.toString());
      }
    }catch(e){
      ShowToast.showToastError(e.toString());
    } finally{
      _isLoading = false;
      notifyListeners();
    }

  }


  void getListData(SearchBusinessData searchBusinessData) {
    getBusinessName.add(searchBusinessData.name);
    getBusinessIds.add(searchBusinessData.id);
    notifyListeners();
  }

  void removeListData(String name, int id){
    print("ID : $id");
    print("Name : $name");
    getBusinessName.remove(name);
    getBusinessIds.remove(id);
    notifyListeners();
  }

}