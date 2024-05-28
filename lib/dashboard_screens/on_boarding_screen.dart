import 'package:bestrateapp/page_route/route_constant.dart';
import 'package:bestrateapp/provider/on_boarding_provider/on_boarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
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


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<OnBoardingProvider>(
        builder: (context, onBoardingProvider, child){
          return  Stack(
            children: [
              // Page view
              PageView(
                controller: onBoardingProvider.pageController,
                onPageChanged: (index){
                    onBoardingProvider.onLastPage = (index == 2);
                },
                children: const [
                  IntroScreen1(),
                  IntroScreen2(),
                  IntroScreen3()
                ],
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 40, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // TextButton(onPressed: (){
                    //   // _controller.jumpToPage(3);
                    // }, child: Image.asset('assets/images/arrow_back_image.png')),
                    GestureDetector(
                      onTap: (){
                        context.goNamed(MyApplicationRouteConstant.SIGNIN_SCREEN);
                      },
                      child: const Text("Skip",style: TextStyle(color: Colors.black, fontSize: 16,
                          fontFamily: 'GTWalsheimPro',
                          fontWeight: FontWeight.w700),
                        textAlign: TextAlign.right,),
                    ),
                  ],
                ),
              ),
              // dot indicator

              Container(
                alignment: const Alignment(0,0.7),
                child: SmoothPageIndicator(
                  controller: onBoardingProvider.pageController,
                  count: 3,
                  effect:  const WormEffect(
                    activeDotColor: Color(0xFF7258DB),
                    dotColor: Color(0xFFA1A1A1),
                    dotWidth: 10,
                    dotHeight: 10,
                  ),
                ),
              ),
              onBoardingProvider.onLastPage ?
              Container(
                alignment: const Alignment(0,0.9),
                child: ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(width: 350, height: 55),

                  child: ElevatedButton(
                    child: Text("Get Started", ),

                    onPressed: () {
                      context.pushNamed(MyApplicationRouteConstant.SIGNIN_SCREEN);
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
                      onBoardingProvider.pageController.nextPage(duration: Duration(microseconds: 500), curve: Curves.decelerate);

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
          );
        }
      )

    );
  }
}
