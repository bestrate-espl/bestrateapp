import 'dart:async';
import 'package:bestrateapp/page_route/route_constant.dart';
import 'package:bestrateapp/sharedpreference/SharedPreferenceHelper.dart';
import 'package:flutter/services.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../dashboard_screens/on_boarding_screen.dart';
// import '../best_rate_web_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  // late final WebViewController _controller;
  @override
  void initState(){
    super.initState();
    // _controller = WebViewController()..loadRequest(
    //   Uri.parse('https://bestrate.encureit.com/'),
    // );

    Timer(Duration(seconds: 3),() async{
      await SharedPreferenceHelper.getLoginState() ? context.goNamed(MyApplicationRouteConstant.DASHBOARD_SCREEN) : context.goNamed(MyApplicationRouteConstant.ON_BOARDING);
    });
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset('assets/images/00_splash.png'),
        ),),),
    );
  }
}
