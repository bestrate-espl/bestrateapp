import 'package:bestrateapp/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../intro_screens/intro_screen_1.dart';
import '../intro_screens/intro_screen_2.dart';
import '../intro_screens/intro_screen_3.dart';
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  // keep track of if we are on the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Page view
          PageView(
            controller: _controller,
            onPageChanged: (index){
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              IntroScreen1(),
              IntroScreen2(),
              IntroScreen3()
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 40, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // TextButton(onPressed: (){
                //   // _controller.jumpToPage(3);
                // }, child: Image.asset('assets/images/arrow_back_image.png')),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                      return SignInScreen();
                    },),);
                  },
                  child: Text("Skip",style: TextStyle(color: Colors.black, fontSize: 16,
                      fontFamily: 'GTWalsheimPro',
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.right,),
                ),
              ],
            ),
          ),
          // dot indicator

          Container(
              alignment: Alignment(0,0.7),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect:  const WormEffect(
                  activeDotColor: Color(0xFF7258DB),
                  dotColor: Color(0xFFA1A1A1),
                  dotWidth: 10,
                  dotHeight: 10,
                ),
              ),
          ),
          onLastPage ?
          Container(
            alignment: Alignment(0,0.9),
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 350, height: 55),

              child: ElevatedButton(
                child: Text("Get Started", ),

                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return SignInScreen();
                  },),);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF7258DB),
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 16,
                    fontFamily: 'GTWalsheimPro',
                    fontWeight: FontWeight.w500,),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),

                ),
              ),
            ),
          ) :
          Container(
            alignment: Alignment(0,0.9),
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 350, height: 55),

              child: ElevatedButton(
                child: Text("NEXT"),

                onPressed: (){
                  _controller.nextPage(duration: Duration(microseconds: 500), curve: Curves.decelerate);

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 16,
                    fontFamily: 'GTWalsheimPro',
                    fontWeight: FontWeight.w500,),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
