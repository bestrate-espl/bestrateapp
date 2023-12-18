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
              child: Text("Headline 1", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'GT Walsheim Pro'),),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(40, 30, 40, 0),
              child: Center(
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi.", style: TextStyle(
                  color: Colors.black, fontSize: 16,
                ),textAlign: TextAlign.center,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
