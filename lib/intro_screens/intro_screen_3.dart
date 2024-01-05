import 'package:flutter/material.dart';
class IntroScreen3 extends StatefulWidget {
  const IntroScreen3({super.key});

  @override
  State<IntroScreen3> createState() => _IntroScreen3State();
}

class _IntroScreen3State extends State<IntroScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.fromLTRB(0, 200, 0, 0)),
            Container(
              child: Image.asset('assets/images/intro_image_3.png'),
            ),

            Container(
              child: Text("Headline 3", style: TextStyle(color: Colors.black, fontSize: 20,
                fontFamily: 'GTWalsheimPro',
                fontWeight: FontWeight.w700,),),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(40, 30, 40, 0),
              child: Center(
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi.", style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'GTWalsheimPro',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),textAlign: TextAlign.center,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
