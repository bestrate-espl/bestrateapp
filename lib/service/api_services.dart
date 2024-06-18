import 'package:bestrateapp/models/add_seller_keyword.dart';
import 'package:bestrateapp/models/area_model.dart';
import 'package:bestrateapp/models/buyer_inquiries_details_model.dart';
import 'package:bestrateapp/models/buyer_inquiries_model.dart';
import 'package:bestrateapp/models/delete_seller_keyword.dart';
import 'package:bestrateapp/models/login_model.dart';
import 'package:bestrateapp/models/profile_update_model.dart';
import 'package:bestrateapp/models/resend_otp_model.dart';
import 'package:bestrateapp/models/seller_inquiries_details_model.dart';
import 'package:bestrateapp/models/seller_keywods_model.dart';
import 'package:bestrateapp/models/seller_profile_model.dart';
import 'package:bestrateapp/models/seller_request_keyword_model.dart';
import 'package:bestrateapp/models/verify_login_otp_model.dart';
import 'package:bestrateapp/models/verify_register_otp_model.dart';
import 'package:bestrateapp/request_models/profile_update_request_model.dart';
import 'package:dio/dio.dart';

import '../models/register_model.dart';
import '../models/search_business_model.dart';
import '../request_models/register_request_model.dart';
import '../utils/contant_url.dart';
import 'dio_service.dart';

class ApiService {

  ApiService._internal();

  static final _apiService = ApiService._internal();

  factory ApiService() => _apiService;

  static Future<AreaModel> getArea() async {
    late AreaModel areaModel;
    try {
      final response = await DioService().dio.get(
          ConstantUrl.getArea,
      );

      if (response.statusCode == 200) {
        areaModel = AreaModel.fromJson(response.data);
        return areaModel;
      } else {
        return AreaModel(
            errorMsg: 'Api failed with status code : ${response.statusCode}',
            isError: true
        );
      }
    } catch (e) {
      return AreaModel(
        errorMsg: 'An error occurred $e',
        isError: true,
      );
    }
  }

  static Future<SearchBusinessModel> getBusiness(String searchKey) async {
    late SearchBusinessModel searchBusinessModel;
    try{
      final response = await DioService().dio.post(
        data: {
          "search_key": searchKey
        },
        ConstantUrl.search_keywords,
        );
        if (response.statusCode == 200){
          searchBusinessModel = SearchBusinessModel.fromJson(response.data);
          return searchBusinessModel;
        }else {
          return SearchBusinessModel(
              errorMsg: 'Api failed with status code : ${response.statusCode}',
              isError: true
          );
        }
    }catch(e){
      return SearchBusinessModel(
        errorMsg: 'An error occurred $e',
        isError: true,
      );
    }

  }

  static Future<RegisterModel> getRegister(RegisterRequestModel requestModel) async {
    late RegisterModel registerModel;
    try{
      final response = await DioService().dio.post(
        data: requestModel.toJson(),
        ConstantUrl.register,
        // options: Options(
        //   headers: {
        //     // 'Authorization': 'Bearer $token',
        //     'Content-Type': 'application/x-www-form-urlencoded',
        //   },
        // )
      );

      if (response.statusCode == 200){
        registerModel = RegisterModel.fromJson(response.data);
        return registerModel;
      }else {
        return RegisterModel(
            errorMsg: 'Api failed with status code : ${response.statusCode}',
            isError: true
        );
      }
    }catch(e){
      return RegisterModel(
        errorMsg: 'An error occurred $e',
        isError: true,
      );
    }

  }

  static Future<VerifyRegisterOtpModel> getVerifyRegisterOtp(String userId, int mobileOtp, int emailOtp) async {
    late VerifyRegisterOtpModel verifyRegisterOtpModel;
    try {
      final response = await DioService().dio.post(
          data: {
            "user_id": userId,
            "mobile_otp": mobileOtp,
            "email_otp": emailOtp
          },
          ConstantUrl.verify_registerotp,
          // options: Options(
          //   headers: {
          //     // 'Authorization': 'Bearer $token',
          //     'Content-Type': 'application/x-www-form-urlencoded',
          //   },
          // )
      );

      if (response.statusCode == 200) {
        verifyRegisterOtpModel = VerifyRegisterOtpModel.fromJson(response.data);
        return verifyRegisterOtpModel;
      } else {
        return VerifyRegisterOtpModel(
            errorMsg: 'Api failed with status code : ${response.statusCode}',
            isError: true
        );
      }
    } catch (e) {
      return VerifyRegisterOtpModel(
        errorMsg: 'An error occurred $e',
        isError: true,
      );
    }
  }

  static Future<LoginModel> getLogin(String mobileNo) async {
    late LoginModel loginModel;
    try {
      final response = await DioService().dio.post(
          data: {
            "mobile": mobileNo,
          },
          ConstantUrl.login,
          options: Options(
            headers: {
              // 'Authorization': 'Bearer $token',
              'Content-Type': 'application/x-www-form-urlencoded',
            },
          )
      );

      if (response.statusCode == 200) {
        loginModel = LoginModel.fromJson(response.data);
        return loginModel;
      } else {
        return LoginModel(
            errorMsg: 'Api failed with status code : ${response.statusCode}',
            isError: true
        );
      }
    } catch (e) {
      return LoginModel(
        errorMsg: 'An error occurred $e',
        isError: true,
      );
    }
  }

  static Future<VerifyLoginOtpModel> getVerifyLoginOtp(String mobileNo, int otp) async {
    late VerifyLoginOtpModel verifyLoginOtpModel;
    try {
      final response = await DioService().dio.post(
          data: {
            "mobile": mobileNo,
            "otp": otp,
          },
          ConstantUrl.verify_loginotp,
          options: Options(
            headers: {
              // 'Authorization': 'Bearer $token',
              'Content-Type': 'application/x-www-form-urlencoded',
            },
          )
      );

      if (response.statusCode == 200) {
        verifyLoginOtpModel = VerifyLoginOtpModel.fromJson(response.data);
        return verifyLoginOtpModel;
      } else {
        return VerifyLoginOtpModel(
            errorMsg: 'Api failed with status code : ${response.statusCode}',
            isError: true
        );
      }
    } catch (e) {
      return VerifyLoginOtpModel(
        errorMsg: 'An error occurred $e',
        isError: true,
      );
    }
  }

  static Future<BuyerInquiriesModel> getBuyerInquiries(int buyerId, String page, String token) async {
    late BuyerInquiriesModel buyerInquiriesModel;
    try {
      final response = await DioService().dio.post(
          data: {
            "buyer_id": 24,
            "page": page,
          },
          ConstantUrl.get_buyer_inquiries,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
          )
      );

      if (response.statusCode == 200) {
        buyerInquiriesModel = BuyerInquiriesModel.fromJson(response.data);
        return buyerInquiriesModel;
      } else {
        return BuyerInquiriesModel(
            errorMsg: 'Api failed with status code : ${response.statusCode}',
            isError: true
        );
      }
    } catch (e) {
      return BuyerInquiriesModel(
        errorMsg: 'An error occurred $e',
        isError: true,
      );
    }
  }

  static Future<BuyerInquiriesDetailsModel> getBuyerInquiriesDetails(String token, int buyerId, int inquiriesId) async {
    late BuyerInquiriesDetailsModel buyerInquiriesDetailsModel;
    try {
      final response = await DioService().dio.post(
          data: {
            "inquiryid": inquiriesId,
            "buyer_id": buyerId,
          },
          ConstantUrl.view_buyer_inquiry,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/x-www-form-urlencoded',
            },
          )
      );

      if (response.statusCode == 200) {
        buyerInquiriesDetailsModel = BuyerInquiriesDetailsModel.fromJson(response.data);
        return buyerInquiriesDetailsModel;
      } else {
        return BuyerInquiriesDetailsModel(
            errorMsg: 'Api failed with status code : ${response.statusCode}',
            isError: true
        );
      }
    } catch (e) {
      return BuyerInquiriesDetailsModel(
        errorMsg: 'An error occurred $e',
        isError: true,
      );
    }
  }

  static Future<SellerProfileModel> getSellerProfile(String token, int sellerId) async {
    late SellerProfileModel sellerProfileModel;
    try {
      final response = await DioService().dio.post(
          data: {
            "role": 3,
            "id": sellerId,
          },
          ConstantUrl.get_profile,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
          )
      );

      if (response.statusCode == 200) {
        sellerProfileModel = SellerProfileModel.fromJson(response.data);
        return sellerProfileModel;
      } else {
        return SellerProfileModel(
            errorMsg: 'Api failed with status code : ${response.statusCode}',
            isError: true
        );
      }
    } catch (e) {
      return SellerProfileModel(
        errorMsg: 'An error occurred $e',
        isError: true,
      );
    }
  }


  static Future<SellerKeywordsModel> getSellerKeywords(String token, int sellerId) async {
    late SellerKeywordsModel sellerKeywordsModel;
    try {
      final response = await DioService().dio.post(
          data: {
            "seller_id": sellerId,
          },
          ConstantUrl.seller_keyword_list,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
          )
      );

      if (response.statusCode == 200) {
        sellerKeywordsModel = SellerKeywordsModel.fromJson(response.data);
        return sellerKeywordsModel;
      } else {
        return SellerKeywordsModel(
            errorMsg: 'Api failed with status code : ${response.statusCode}',
            isError: true
        );
      }
    } catch (e) {
      return SellerKeywordsModel(
        errorMsg: 'An error occurred $e',
        isError: true,
      );
    }
  }



  static Future<AddSellerKeywordModel> getAddSellerKeyword(String token, int sellerId, int keywordId) async {
    late AddSellerKeywordModel addSellerKeywordModel;
    try {
      final response = await DioService().dio.post(
          data: {
            "keyword_id": keywordId,
            "seller_id": sellerId,

          },
          ConstantUrl.add_seller_keyword,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
          )
      );

      if (response.statusCode == 200) {
        addSellerKeywordModel = AddSellerKeywordModel.fromJson(response.data);
        return addSellerKeywordModel;
      } else {
        return AddSellerKeywordModel(
            errorMsg: 'Api failed with status code : ${response.statusCode}',
            isError: true
        );
      }
    } catch (e) {
      return AddSellerKeywordModel(
        errorMsg: 'An error occurred $e',
        isError: true,
      );
    }
  }





  static Future<ResendOtpModel> getResendOtpMobile(int mobile) async {
    late ResendOtpModel resendOtpModel;
    try {
      final response = await DioService().dio.post(
          data: {
            "mobile": mobile,

          },
          ConstantUrl.resend_mobile_otp,
          options: Options(
            headers: {
              // 'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
          )
      );

      if (response.statusCode == 200) {
        resendOtpModel = ResendOtpModel.fromJson(response.data);
        return resendOtpModel;
      } else {
        return ResendOtpModel(
            errorMsg: 'Api failed with status code : ${response.statusCode}',
            isError: true
        );
      }
    } catch (e) {
      return ResendOtpModel(
        errorMsg: 'An error occurred $e',
        isError: true,
      );
    }
  }

  static Future<ResendOtpModel> getResendOtpEmail(String email) async {
    late ResendOtpModel resendOtpModel;
    try {
      final response = await DioService().dio.post(
          data: {
            "email": email,

          },
          ConstantUrl.resend_email_otp,
          options: Options(
            headers: {
              // 'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
          )
      );

      if (response.statusCode == 200) {
        resendOtpModel = ResendOtpModel.fromJson(response.data);
        return resendOtpModel;
      } else {
        return ResendOtpModel(
            errorMsg: 'Api failed with status code : ${response.statusCode}',
            isError: true
        );
      }
    } catch (e) {
      return ResendOtpModel(
        errorMsg: 'An error occurred $e',
        isError: true,
      );
    }
  }




  // static Future<SendQuotationModel> getSendQuotation(String token, String inquiryid, String amount,
  //     String details, String filePath, String fileName) async {
  //   FormData data = FormData.fromMap({
  //     "inquiryid" : inquiryid,
  //     "amount" :  amount,
  //     "details" : details,
  //     "image[]" : await MultipartFile.fromFile(filePath, filename: fileName)
  //
  //   });
  //   late SendQuotationModel quotationModel;
  //   try{
  //     final response = await DioService().dio.post(
  //         data: data,
  //         ConstantUrl.sendquotation,
  //         options: Options(
  //           headers: {
  //             'Authorization': 'Bearer $token',
  //             'Content-Type': 'application/json',
  //           },
  //         )
  //     );
  //
  //     if (response.statusCode == 200){
  //       quotationModel = SendQuotationModel.fromJson(response.data);
  //       return quotationModel;
  //     }else {
  //       return SendQuotationModel(
  //           errorMsg: 'Api failed with status code : ${response.statusCode}',
  //           isError: true
  //       );
  //     }
  //   }catch(e){
  //     return SendQuotationModel(
  //       errorMsg: 'An error occurred $e',
  //       isError: true,
  //     );
  //   }
  //
  // }
}