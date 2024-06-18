
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:bestrateapp/models/buyer_inquiries_details_model.dart';
import 'package:bestrateapp/service/api_services.dart';
import 'package:bestrateapp/utils/show_toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

import '../models/buyer_inquiries_model.dart';


class BuyerInquiriesProvider extends ChangeNotifier{
  BuyerInquiriesModel? _buyerInquiriesModel;
  BuyerInquiriesDetailsModel? _buyerInquiriesDetailsModel;
  bool _isLoading = false;
  String?  fileName, filePath;
  File? file;



  BuyerInquiriesModel? get buyerInquiriesModel => _buyerInquiriesModel;
  BuyerInquiriesDetailsModel? get buyerInquiriesDetailsModel => _buyerInquiriesDetailsModel;
  bool get isLoading => _isLoading;
  
  
  Future<void> getBuyerInquiries(String token, int buyerId, String page) async {
    _isLoading = true;
    notifyListeners();
    try {
      _buyerInquiriesModel = await ApiService.getBuyerInquiries(buyerId, page, token);
      if (_buyerInquiriesModel!.statusCode == 200 && _buyerInquiriesModel!.status == true){
        if (_buyerInquiriesModel!.inquiries != null){
          notifyListeners();
          log(_buyerInquiriesModel!.toJson().toString() ?? '', name: "Buyer Inquiries Data");
        }else{
          ShowToast.showToastError(_buyerInquiriesModel!.message.toString());
        }
      }else{
        ShowToast.showToastError(_buyerInquiriesModel!.message.toString());
      }
    }catch(e){
      ShowToast.showToastError(e.toString());
    }finally {
      _isLoading = false;
      notifyListeners();
    }
  }


  Future<void> getBuyerInquiriesDetails(String token, int buyerId, int inquiriesId) async {
    _isLoading = true;
    notifyListeners();
    try {
      _buyerInquiriesDetailsModel = await ApiService.getBuyerInquiriesDetails(token, buyerId, inquiriesId);
      if (_buyerInquiriesDetailsModel!.statusCode == 200 &&
          _buyerInquiriesDetailsModel!.status == true){
            notifyListeners();
           log(_buyerInquiriesDetailsModel!.toJson().toString() ?? '', name: "Seller Inquiries Data");
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

  // Future<void> getSendQuotation(String token, String inquiryid, String amount, String details, String filePath, String fileName) async {
  //   _isLoading = true;
  //   notifyListeners();
  //   try {
  //     _sendQuotationModel = await ApiService.getSendQuotation(token,inquiryid,amount,details,filePath, fileName);
  //     if (_sendQuotationModel!.statusCode == 200 && _sendQuotationModel!.status == true){
  //       ShowToast.shoToastSuccess(_sendQuotationModel!.message.toString());
  //       clearProviderData();
  //       notifyListeners();
  //       log(_sendQuotationModel!.toJson().toString() ?? '', name: "Seller Inquiries Data");
  //     }else{
  //       ShowToast.showToastError("Something went wrong");
  //     }
  //   }catch(e){
  //     ShowToast.showToastError(e.toString());
  //   }finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }
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