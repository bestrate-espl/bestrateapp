import 'package:flutter/material.dart';
class RegistrationScreen1 extends StatefulWidget {
  const RegistrationScreen1({super.key});

  @override
  State<RegistrationScreen1> createState() => _RegistrationScreen1State();
}

class _RegistrationScreen1State extends State<RegistrationScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Padding(padding: EdgeInsets.all(10),
                    child: Image.asset('assets/images/arrow_back_image.png'),
                  ),
                ),
                Expanded(child: Center(
                  child: Padding(padding: EdgeInsets.fromLTRB(0,10,0,0),
                    child: Text("Create an Account", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.black),),),
                ),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 40),
            child: Text("1. Buyer Information Details", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  TextField()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
