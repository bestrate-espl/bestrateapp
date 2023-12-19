import 'package:flutter/material.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/best_rate_app_logo.png'),
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
               child: Text('Best Rate',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),)
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Text('Welcome!',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),)
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text('Enter your phone no to continue',style: TextStyle(fontSize: 16),)
            ),
            Padding(padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
                child: TextField(
                  keyboardType: TextInputType.number,

                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Mobile Number',
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color(0xFF7258DB),
                        width: 2,

                      )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xFFA1A1A1),
                          width: 2,

                        )
                    ),

                    prefix: Icon(Icons.phone_android, size: 25,)

                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
