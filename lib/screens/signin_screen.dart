import 'package:bestrateapp/screens/otp_login_screen.dart';
import 'package:bestrateapp/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/best_rate_color_constant.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Image.asset('assets/images/best_rate_app_logo.png')
                  ),
                  Container(
                    child: const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text('Best Rate',style: TextStyle(fontSize: 32,
                          color: BestRateColorConstant.darkBlack,
                          fontFamily: 'GTWalsheimPro',
                          fontWeight: FontWeight.w700,),)
                    ),
                  ),
                  Container(
                    child: const Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: Text('Welcome!',style: TextStyle(fontSize: 22,
                          color: BestRateColorConstant.darkBlack,
                          fontFamily: 'GTWalsheimPro',
                          fontWeight: FontWeight.w700,),)
                    ),
                  ),
                  Container(
                    child: const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text('Enter your phone no to continue',style: TextStyle(fontSize: 16,
                            fontFamily: 'GTWalsheimPro',
                            fontWeight: FontWeight.w400,
                            color: BestRateColorConstant.appSecondaryColor),)
                    ),
                  ),
                  Container(
                    child: Padding(padding: EdgeInsets.fromLTRB(40, 16, 40, 0),
                        child: TextField(
                          cursorColor: BestRateColorConstant.appSecondaryColor,
                          maxLines: 1,
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontFamily: 'GTWalsheimPro',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: BestRateColorConstant.darkBlack),
                          decoration: InputDecoration(
                              hintText: "Mobile Number",
                              prefixIcon: Image.asset('assets/images/phone_iphone.png'),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: BestRateColorConstant.appSecondaryColor)
                              )
                          ),
                        )
                    ),
                  ),
                  Container(
                    child: Padding(padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 350, height: 55),

                        child: ElevatedButton(
                          child: Text("Send OTP", style: TextStyle(fontSize: 16,
                            fontFamily: 'GTWalsheimPro',
                            fontWeight: FontWeight.w700,
                          color: Colors.white),),

                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return OTPScreen();
                            },),);
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
                  ),

                ],
              ),
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                            children : [
                              Padding(padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                                  child: Text("Don't have an account?",style: TextStyle(fontSize: 16,
                                      color: BestRateColorConstant.darkBlack,
                                    fontFamily: 'GTWalsheimPro',
                                    fontWeight: FontWeight.w400,),)

                              ),
                              Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints.tightFor(width: 350, height: 55),

                                  child: ElevatedButton(
                                    child: Text("Sign Up"),

                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context){
                                        return RegistrationScreen();
                                      },),);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: BestRateColorConstant.appPrimaryColor,
                                      foregroundColor: Colors.white,
                                      textStyle: TextStyle(fontSize: 16,
                                          fontFamily: 'GTWalsheimPro',
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
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
            )
          ],
        ),
      ),

    );
  }
}
