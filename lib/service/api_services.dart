
import 'package:bestrateapp/models/accept_quotation_model.dart';
import 'package:bestrateapp/models/area_model.dart';
import 'package:bestrateapp/models/buyer_accept_inquiries_model.dart';
import 'package:bestrateapp/models/buyer_inquiries_details_model.dart';
import 'package:bestrateapp/models/buyer_inquiries_model.dart';
import 'package:bestrateapp/models/buyer_reject_inquiries_model.dart';
import 'package:bestrateapp/models/create_inquiries_model.dart';

import 'package:bestrateapp/models/login_model.dart';
import 'package:bestrateapp/models/profile_model.dart';
import 'package:bestrateapp/models/reject_quotation_model.dart';

import 'package:bestrateapp/models/resend_otp_model.dart';
import 'package:bestrateapp/models/update_profile_model.dart';

import 'package:bestrateapp/models/verify_login_otp_model.dart';
import 'package:bestrateapp/models/verify_otp_model.dart';
import 'package:bestrateapp/models/verify_register_otp_model.dart';
import 'package:bestrateapp/request_models/request_update_profile_model.dart';
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

  static Future<VerifyOtpModel> getVerifyRegisterOtp(String userId, int mobileOtp, int emailOtp) async {
    late VerifyOtpModel verifyOtpModel;
    try {
      final response = await DioService().dio.post(
          data: {
            "user_id": userId,
            "mobile_otp": mobileOtp,
            "email_otp": emailOtp,
            "role": 2
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
        verifyOtpModel = VerifyOtpModel.fromJson(response.data);
        return verifyOtpModel;
      } else {
        return VerifyOtpModel(
            errorMsg: 'Api failed with status code : ${response.statusCode}',
            isError: true
        );
      }
    } catch (e) {
      return VerifyOtpModel(
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

  static Future<VerifyOtpModel> getVerifyLoginOtp(String mobileNo, int otp) async {
    late VerifyOtpModel verifyOtpModel;
    try {
      final response = await DioService().dio.post(
          data: {
            "mobile": mobileNo,
            "otp": otp,
            "role": 2
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
        verifyOtpModel = VerifyOtpModel.fromJson(response.data);
        return verifyOtpModel;
      } else {
        return VerifyOtpModel(
            errorMsg: 'Api failed with status code : ${response.statusCode}',
            isError: true
        );
      }
    } catch (e) {
      return VerifyOtpModel(
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
            "buyer_id": buyerId,
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


  static Future<AcceptQuotationModel> getInquiriesAcceptQuotation(String token, int inquiriesId) async {
    late AcceptQuotationModel acceptQuotationModel;
    try {
      final response = await DioService().dio.post(
          data: {
            "inquiry_id": inquiriesId,
          },
          ConstantUrl.buyer_accept_quotation,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/x-www-form-urlencoded',
            },
          )
      );

      if (response.statusCode == 200) {
        acceptQuotationModel = AcceptQuotationModel.fromJson(response.data);
        return acceptQuotationModel;
      } else {
        return AcceptQuotationModel(
            errorMsg: 'Api failed with status code : ${response.statusCode}',
            isError: true
        );
      }
    } catch (e) {
      return AcceptQuotationModel(
        errorMsg: 'An error occurred $e',
        isError: true,
      );
    }
  }

  static Future<RejectQuotationModel> getInquiriesRejectQuotation(String token, int inquiriesId) async {
    late RejectQuotationModel rejectQuotationModel;
    try {
      final response = await DioService().dio.post(
          data: {
            "inquiry_id": inquiriesId,
          },
          ConstantUrl.buyer_reject_quotation,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/x-www-form-urlencoded',
            },
          )
      );

      if (response.statusCode == 200) {
        rejectQuotationModel = RejectQuotationModel.fromJson(response.data);
        return rejectQuotationModel;
      } else {
        return RejectQuotationModel(
            errorMsg: 'Api failed with status code : ${response.statusCode}',
            isError: true
        );
      }
    } catch (e) {
      return RejectQuotationModel(
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

  static Future<BuyerAcceptInquiriesModel> getBuyerAcceptInquiries(String token, int buyerId) async {
    late BuyerAcceptInquiriesModel acceptInquiriesModel;
    try {
      final response = await DioService().dio.post(
          data: {
            "buyer_id": buyerId,

          },
          ConstantUrl.buyer_accepted_inquiry,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
          )
      );

      if (response.statusCode == 200) {
        acceptInquiriesModel = BuyerAcceptInquiriesModel.fromJson(response.data);
        return acceptInquiriesModel;
      } else {
        return BuyerAcceptInquiriesModel(
            errorMsg: 'Api failed with status code : ${response.statusCode}',
            isError: true
        );
      }
    } catch (e) {
      return BuyerAcceptInquiriesModel(
        errorMsg: 'An error occurred $e',
        isError: true,
      );
    }

  }


  static Future<BuyerRejectInquiriesModel> getBuyerRejectInquiries(String token, int buyerId) async {
    late BuyerRejectInquiriesModel rejectInquiriesModel;
    try {
      final response = await DioService().dio.post(
          data: {
            "buyer_id": buyerId,

          },
          ConstantUrl.buyer_rejected_inquiry,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
          )
      );

      if (response.statusCode == 200) {
        rejectInquiriesModel = BuyerRejectInquiriesModel.fromJson(response.data);
        return rejectInquiriesModel;
      } else {
        return BuyerRejectInquiriesModel(
            errorMsg: 'Api failed with status code : ${response.statusCode}',
            isError: true
        );
      }
    } catch (e) {
      return BuyerRejectInquiriesModel(
        errorMsg: 'An error occurred $e',
        isError: true,
      );
    }

  }
  static Future<CreateInquiriesModel> getCreateInquiries(String token, String buyerId, int keywordId, String quantity,
      String description, String startBudget, String endBudget ,String filePath, String fileName) async {
    FormData data = FormData.fromMap({
      "buyer_id" : buyerId,
      "keyword_id" :  keywordId,
      "quantity" : quantity,
      "description" : description,
      "budget_start" : startBudget,
      "budget_end" : endBudget,
      "image[]" : await MultipartFile.fromFile(filePath, filename: fileName)

    });
    late CreateInquiriesModel createInquiriesModel;
    try{
      final response = await DioService().dio.post(
          data: data,
          ConstantUrl.create_buyer_inquiry,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
          )
      );

      if (response.statusCode == 200){
        createInquiriesModel = CreateInquiriesModel.fromJson(response.data);
        return createInquiriesModel;
      }else {
        return CreateInquiriesModel(
            errorMsg: 'Api failed with status code : ${response.statusCode}',
            isError: true
        );
      }
    }catch(e){
      return CreateInquiriesModel(
        errorMsg: 'An error occurred $e',
        isError: true,
      );
    }

  }

  static Future<ProfileModel> getProfile(String token, int buyerId) async {
    late ProfileModel profileModel;
    try {
      final response = await DioService().dio.post(
          data: {
            "role": "2",
            "id": buyerId,

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
        profileModel = ProfileModel.fromJson(response.data);
        return profileModel;
      } else {
        return ProfileModel(
            errorMsg: 'Api failed with status code : ${response.statusCode}',
            isError: true
        );
      }
    } catch (e) {
      return ProfileModel(
        errorMsg: 'An error occurred $e',
        isError: true,
      );
    }

  }

  static Future<UpdateProfileModel> getUpdateProfile(String token, RequestUpdateProfileModel requestUpdateProfile) async {
    late UpdateProfileModel updateProfileModel;
    try {
      final response = await DioService().dio.post(
          data: requestUpdateProfile.toJson(),
          ConstantUrl.update_buyer_profile,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
          )
      );

      if (response.statusCode == 200) {
        updateProfileModel = UpdateProfileModel.fromJson(response.data);
        return updateProfileModel;
      } else {
        return UpdateProfileModel(
            errorMsg: 'Api failed with status code : ${response.statusCode}',
            isError: true
        );
      }
    } catch (e) {
      return UpdateProfileModel(
        errorMsg: 'An error occurred $e',
        isError: true,
      );
    }

  }
}