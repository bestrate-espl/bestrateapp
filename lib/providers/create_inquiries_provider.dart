import 'dart:developer';
import 'dart:io';

import 'package:bestrateapp/models/create_inquiries_model.dart';
import 'package:bestrateapp/service/api_services.dart';
import 'package:bestrateapp/utils/show_toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

class CreateInquiriesProvider extends ChangeNotifier{
  CreateInquiriesModel? _createInquiriesModel;
  bool _isLoading = false;
  String?  fileName, filePath;
  File? file;

  CreateInquiriesModel? get createInquiriesModel => _createInquiriesModel;
  bool get isLoading => _isLoading;



  Future<void> getCreateInquiries(String token, String buyerId, int keywordId, String quantity,
      String description, String startBudget, String endBudget ,String filePath, String fileName) async {
    _isLoading = true;
    notifyListeners();
    try {
      _createInquiriesModel = await ApiService.getCreateInquiries(token, buyerId, keywordId, quantity, description, startBudget, endBudget, filePath, fileName);
      if (_createInquiriesModel!.statusCode == 200 && _createInquiriesModel!.status == true){
        ShowToast.shoToastSuccess(_createInquiriesModel!.message.toString());
        clearProviderData();
        notifyListeners();
        log(_createInquiriesModel!.toJson().toString() ?? '', name: "Seller Inquiries Data");
      }else{
        ShowToast.showToastError("Something went wrong");
      }
    }catch(e){
      ShowToast.showToastError(e.toString());
    }finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = File(result.files.single.path ?? " ");
      fileName = file?.path.split('/').last;
      filePath = file?.path;
      notifyListeners();

    }
  }

  void clearProviderData(){
    fileName = null;
    filePath = null;
    notifyListeners();
  }


}