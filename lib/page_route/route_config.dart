import 'package:bestrateapp/dashboard_screens/dashboard_screen.dart';
import 'package:bestrateapp/dashboard_screens/on_boarding_screen.dart';
import 'package:bestrateapp/drawer/screen/error_screen.dart';
import 'package:bestrateapp/login_screens/signin_screen.dart';
import 'package:bestrateapp/otp_screens/otp_login_screen.dart';
import 'package:bestrateapp/otp_screens/otp_registration_screen.dart';
import 'package:bestrateapp/page_route/route_constant.dart';
import 'package:bestrateapp/registration_screens/registration_screen.dart';
import 'package:bestrateapp/splas_screens/splase_sereen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        // pageBuilder: (context, state){
        //   return MaterialPage(child: SplashScreen());
        // }
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
            return OtpRegistrationScreen();
          }
      ),

      GoRoute(
          name: MyApplicationRouteConstant.DASHBOARD_SCREEN,
          path: "/dashboard_screen",
          builder: (context, state){
            return DashboardScreen();
          }
      ),

    ],
    errorPageBuilder: (context, state){
      return MaterialPage(child: ErrorScreen());
    }
  );
}