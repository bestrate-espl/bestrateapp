
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:bestrateapp/models/accept_quotation_model.dart';
import 'package:bestrateapp/models/buyer_accept_inquiries_model.dart';
import 'package:bestrateapp/models/buyer_inquiries_details_model.dart';
import 'package:bestrateapp/models/buyer_reject_inquiries_model.dart';
import 'package:bestrateapp/models/reject_quotation_model.dart';
import 'package:bestrateapp/page_route/route_constant.dart';
import 'package:bestrateapp/service/api_services.dart';
import 'package:bestrateapp/sharedpreference/SharedPreferenceHelper.dart';
import 'package:bestrateapp/sharedpreference/sharedpreference_constant.dart';
import 'package:bestrateapp/utils/show_toast.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fl_downloader/fl_downloader.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../models/buyer_inquiries_model.dart';


class BuyerInquiriesProvider extends ChangeNotifier{
  BuyerInquiriesModel? _buyerInquiriesModel;
  BuyerInquiriesDetailsModel? _buyerInquiriesDetailsModel;
  BuyerAcceptInquiriesModel? _acceptInquiriesModel;
  BuyerRejectInquiriesModel? _rejectInquiriesModel;
  AcceptQuotationModel? _acceptQuotationModel;
  RejectQuotationModel? _rejectQuotationModel;
  bool _isLoading = false;
  int? progress = 0;
  StreamSubscription? progressStream;



  BuyerInquiriesModel? get buyerInquiriesModel => _buyerInquiriesModel;
  BuyerInquiriesDetailsModel? get buyerInquiriesDetailsModel => _buyerInquiriesDetailsModel;
  BuyerAcceptInquiriesModel? get acceptInquiriesModel => _acceptInquiriesModel;
  BuyerRejectInquiriesModel? get rejectInquiriesModel => _rejectInquiriesModel;
  AcceptQuotationModel? get acceptQuotationModel => _acceptQuotationModel;
  RejectQuotationModel? get rejectQuotationModel => _rejectQuotationModel;
  bool get isLoading => _isLoading;
  
  
  Future<void> getBuyerInquiries(String token, int buyerId, String page, BuildContext context) async {
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
      }else if(_buyerInquiriesModel?.statusCode != 500 && _buyerInquiriesModel!.status != false){
        SharedPreferenceHelper.clearLoginState();
        context.goNamed(MyApplicationRouteConstant.ON_BOARDING);
        ShowToast.showToastError("Session Expired!!");
      }
    }catch(e) {
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

  Future<void> getBuyerAcceptInquiries(String token, int buyerId) async {
    _isLoading = true;
    notifyListeners();
    try {
      _acceptInquiriesModel = await ApiService.getBuyerAcceptInquiries(token, buyerId);
      if (_acceptInquiriesModel!.statusCode == 200 &&
          _acceptInquiriesModel!.status == true){
        notifyListeners();
        log(_acceptInquiriesModel!.toJson().toString() ?? '', name: "Seller Inquiries Data");
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

  Future<void> getBuyerRejectInquiries(String token, int buyerId) async {
    _isLoading = true;
    notifyListeners();
    try {
      _rejectInquiriesModel = await ApiService.getBuyerRejectInquiries(token, buyerId);
      if (_rejectInquiriesModel!.statusCode == 200 &&
          _rejectInquiriesModel!.status == true){
        notifyListeners();
        log(_rejectInquiriesModel!.toJson().toString() ?? '', name: "Seller Inquiries Data");
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

  Future<void> getAcceptQuotation(String token, int buyerId, int inquiriesId, int acceptInquiriesId) async {
    _isLoading = true;
    notifyListeners();
    try {
      _acceptQuotationModel = await ApiService.getInquiriesAcceptQuotation(token, acceptInquiriesId);
      if (_acceptQuotationModel!.statusCode == 200 &&
          _acceptQuotationModel!.status == true){
        getBuyerInquiriesDetails(token,buyerId,inquiriesId);
        notifyListeners();
        log(_acceptQuotationModel!.toJson().toString() ?? '', name: "Seller Inquiries Data");
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

  Future<void> getRejectQuotation(String token, int buyerId, int inquiriesId, int acceptInquiriesId) async {
    _isLoading = true;
    notifyListeners();
    try {
      _rejectQuotationModel = await ApiService.getInquiriesRejectQuotation(token, inquiriesId);
      if (_rejectQuotationModel!.statusCode == 200 &&
          _rejectQuotationModel!.status == true){
        getBuyerInquiriesDetails(token,buyerId,inquiriesId);
        notifyListeners();
        log(_rejectQuotationModel!.toJson().toString() ?? '', name: "Seller Inquiries Data");
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


  void getDownload(){
    FlDownloader.initialize();
    progressStream = FlDownloader.progressStream.listen((event){
      if (event.status == DownloadStatus.successful){
          progress = event.progress;
          if (progress == 100){
            progress = 0;
          }
          ShowToast.shoToastSuccess("File downloaded successfully!!");

        FlDownloader.openFile(filePath: event.filePath);
      }else if (event.status == DownloadStatus.running){
          progress = event.progress;
      }else if (event.status == DownloadStatus.failed){
        ShowToast.showToastError("Download Error!!");
      }
    });
  }

}