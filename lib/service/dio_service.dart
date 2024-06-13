import 'dart:developer';
import 'package:dio/dio.dart';

import '../utils/contant_url.dart';




class DioService {
  final dio = createDio();
  final tokenDio = Dio(BaseOptions(baseUrl: ConstantUrl.baseUrl));

  DioService._internal();

  static final _singleton = DioService._internal();

  factory DioService() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: ConstantUrl.baseUrl,
      receiveTimeout: const Duration(seconds: 10),
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
    ));

    dio.interceptors.addAll({
      AppInterceptors(),
    });
    return dio;
  }
}

class AppInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('REQUEST[${options.method}] => PATH: ${options.path} => DATA${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('RESPONSE[${response.statusCode}] => PATH: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException error, ErrorInterceptorHandler handler) async {
    log('ERROR[${error.response?.statusCode}] => MESSAGE: ${error.message}');
    if (error.response?.statusCode == 401) {
      // logoutAlert(navigatorKey.currentContext!, 'Unauthenticated, Please Login Again', () {
      //   LocalDB.logout();
      //   GoRouter.of(navigatorKey.currentContext!).pushNamed(AppRoutesConstants.loginRouteName);
      // });
    } else {
      if (error.response != null) {
        // GoRouter.of(navigatorKey.currentContext!)
        //     .pushReplacementNamed(AppRoutesConstants.errorPage, queryParams: {
        //   "msg": error.response?.data['message'] ?? 'Something went wrong',
        //   "code": error.response?.data['status_code'].toString() ?? "0",
        // });
      }
    }
    super.onError(error, handler);
  }
}