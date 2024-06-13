
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:bestrateapp/models/seller_inquiries_details_model.dart';
import 'package:bestrateapp/models/seller_inquiries_model.dart';
import 'package:bestrateapp/models/send_quotation_model.dart';
import 'package:bestrateapp/service/api_services.dart';
import 'package:bestrateapp/utils/show_toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

class SellerInquiriesProvider extends ChangeNotifier{
  SellerInquiriesModel? _sellerInquiriesModel;
  SellerInquiriesDetailsModel? _sellerInquiriesDetailsModel;
  SendQuotationModel? _sendQuotationModel;
  bool _isLoading = false;
  String?  fileName, filePath;
  File? file;



  SellerInquiriesModel? get sellerInquiriesModel => _sellerInquiriesModel;
  SellerInquiriesDetailsModel? get sellerInquiriesDetailsModel => _sellerInquiriesDetailsModel;
  SendQuotationModel? get sendQuotationModel => _sendQuotationModel;
  bool get isLoading => _isLoading;
  
  
  Future<void> getSellerInquiries(String token, int userId, String page) async {
    _isLoading = true;
    notifyListeners();
    try {
      _sellerInquiriesModel = await ApiService.getSellerInquiries(userId, page, token);
      if (_sellerInquiriesModel!.statusCode == 200 && _sellerInquiriesModel!.status == true){
        if (_sellerInquiriesModel!.inquiries != null){
          notifyListeners();
          log(_sellerInquiriesModel!.toJson().toString() ?? '', name: "Seller Inquiries Data");
        }else{
          ShowToast.showToastError("No data found");
        }
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


  Future<void> getSellerInquiriesDetails(String token, int inquiriesId) async {
    _isLoading = true;
    notifyListeners();
    try {
      _sellerInquiriesDetailsModel = await ApiService.getSellerInquiriesDetails(token, inquiriesId);
      if (_sellerInquiriesDetailsModel!.statusCode == 200 &&
          _sellerInquiriesDetailsModel!.status == true){
            notifyListeners();
           log(_sellerInquiriesDetailsModel!.toJson().toString() ?? '', name: "Seller Inquiries Data");
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

  Future<void> getSendQuotation(String token, String inquiryid, String amount, String details, String filePath, String fileName) async {
    _isLoading = true;
    notifyListeners();
    try {
      _sendQuotationModel = await ApiService.getSendQuotation(token,inquiryid,amount,details,filePath, fileName);
      if (_sendQuotationModel!.statusCode == 200 && _sendQuotationModel!.status == true){
        ShowToast.shoToastSuccess(_sendQuotationModel!.message.toString());
        clearProviderData();
        notifyListeners();
        log(_sendQuotationModel!.toJson().toString() ?? '', name: "Seller Inquiries Data");
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