import 'dart:ffi';

import 'package:bestrateapp/dashboard_screens/dashboard_screen.dart';
import 'package:bestrateapp/dashboard_screens/on_boarding_screen.dart';
import 'package:bestrateapp/drawer/screen/error_screen.dart';
import 'package:bestrateapp/drawer/screen/home.dart';
import 'package:bestrateapp/drawer/screen/view_inquiry_details.dart';
import 'package:bestrateapp/login_screens/signin_screen.dart';
import 'package:bestrateapp/otp_screens/otp_login_screen.dart';
import 'package:bestrateapp/otp_screens/otp_registration_screen.dart';
import 'package:bestrateapp/page_route/route_constant.dart';
import 'package:bestrateapp/registration_screens/registration_screen.dart';
import 'package:bestrateapp/request_models/otp_registration_verify_data.dart';
import 'package:bestrateapp/splas_screens/splase_sereen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/register_model.dart';

class MyApplicationRouter{


 static final GoRouter router = GoRouter(
   initialLocation: "/",
    routes: <RouteBase> [
      GoRoute(
        name: MyApplicationRouteConstant.SPLASH_SCREEN,
        path: "/",
        builder: (context, state){
          return SplashScreen();
        }
      ),

      GoRoute(
          name: MyApplicationRouteConstant.ON_BOARDING,
          path: "/on_boarding",
          builder: (context, state){
          return OnBoardingScreen();
        },
      ),

      GoRoute(
          name: MyApplicationRouteConstant.SIGNIN_SCREEN,
          path: "/sign_in",
          builder: (context, state){
          return SignInScreen();
        },
      ),

      GoRoute(
          name: MyApplicationRouteConstant.OTP_SIGNIN_SCREEN,
          path: "/otp_sign_screen",
          builder: (context, state){
            return OTPScreen();
          }
      ),

      GoRoute(
          name: MyApplicationRouteConstant.REGISTRATION_SCREEN,
          path: "/registration_screen",
          builder: (context, state){
            return RegistrationScreen();
          }
      ),

      GoRoute(
          name: MyApplicationRouteConstant.OTP_REGISTRATION_SCREEN,
          path: "/otp_registration_screen",
          builder: (context, state){
            final OtpRegistrationVerifyData data = state.extra as OtpRegistrationVerifyData;
            return OtpRegistrationScreen(
              userId: data.userId,
              mobileNo: data.mobileNo,
              mobileOtp: data.mobileOtp,
              emailId: data.emailId,
              emailOtp: data.emailOtp,
            );
          }
      ),

      GoRoute(
          name: MyApplicationRouteConstant.DASHBOARD_SCREEN,
          path: "/dashboard_screen",
          builder: (context, state){
            return DashboardScreen();
          }
      ),

      GoRoute(
          name: MyApplicationRouteConstant.HOME_SCREEN,
          path: "/home_screen",
          builder: (context, state){
            return Home();
          }
      ),

      GoRoute(
          name: MyApplicationRouteConstant.INQUIRIES_DETAILS_SCREEN,
          path: "/inquiries_details_screen",
          builder: (context, state){
            return ViewInquiryDetails(
              inquiriesId: state.extra as int,
            );
          }
      ),

    ],
    errorPageBuilder: (context, state){
      return MaterialPage(child: ErrorScreen());
    }
  );
}