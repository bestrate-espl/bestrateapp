import 'package:bestrateapp/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class SignInWithMobileScreen extends StatefulWidget {
  const SignInWithMobileScreen({super.key});

  @override
  State<SignInWithMobileScreen> createState() => _SignInWithMobileScreenState();
}

class _SignInWithMobileScreenState extends State<SignInWithMobileScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/best_rate_app_logo.png'),
                const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text('Best Rate',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),)
                ),
                const Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Text('Welcome!',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),)
                ),
                const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text('Enter your phone no to continue',style: TextStyle(fontSize: 16,color: Color(0xFFA1A1A1)),)
                ),
                Padding(padding: EdgeInsets.fromLTRB(40, 16, 40, 0),
                    child: TextField(
                      cursorColor: Color(0xFFA1A1A1),
                      maxLines: 1,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          prefixIcon: Image.asset('assets/images/phone_icon.png'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Color(0xFFA1A1A1))
                          )
                      ),
                    )
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 350, height: 55),

                    child: ElevatedButton(
                      child: Text("Send OTP"),

                      onPressed: (){

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(fontSize: 18),
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
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                            children : [
                              Padding(padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                                  child: Text('Dont have an account?',style: TextStyle(fontSize: 16,color: Color(0xFFA1A1A1)),)

                              ),
                              Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints.tightFor(width: 350, height: 55),

                                  child: ElevatedButton(
                                    child: Text("Sign Up with Email"),

                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context){
                                        return OTPScreen();
                                      },),);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF7258DB),
                                      foregroundColor: Colors.white,
                                      textStyle: TextStyle(fontSize: 16),
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),

                                    ),
                                  ),
                                ),
                              ),
                            ]

                        )


                    )
                  ],
                ),
              ),
            ),
          )

        ],
      ),

    );
  }
}
