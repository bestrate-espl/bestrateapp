import 'package:bestrateapp/constant/best_rate_color_constant.dart';
import 'package:flutter/material.dart';
class IntroScreen1 extends StatefulWidget {
  const IntroScreen1({super.key});

  @override
  State<IntroScreen1> createState() => _IntroScreen1State();
}

class _IntroScreen1State extends State<IntroScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.fromLTRB(0, 200, 0, 0)),
            Container(
              child: Image.asset('assets/images/intro_image_1.png'),
            ),

            Container(
              child: Text("Headline 1", style: TextStyle(color: BestRateColorConstant.darkBlack, fontSize: 20,
                  fontFamily: 'GTWalsheimPro',
                  fontWeight: FontWeight.w700,),),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(40, 30, 40, 0),
              child: Center(
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi.", style: TextStyle(
                  fontFamily: 'GTWalsheimPro',
                  fontWeight: FontWeight.w400,
                  color: BestRateColorConstant.darkBlack, fontSize: 16,
                ),textAlign: TextAlign.center,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
