import 'package:bestrateapp/constant/best_rate_color_constant.dart';
import 'package:bestrateapp/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class OtpRegistrationScreen extends StatefulWidget {
  const OtpRegistrationScreen({super.key});

  @override
  State<OtpRegistrationScreen> createState() => _OtpRegistrationScreenState();
}

class _OtpRegistrationScreenState extends State<OtpRegistrationScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
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
                  child: Padding(padding: EdgeInsets.all(10),
                    child: Text("OTP Authentication", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.black),),),
                ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: BestRateColorConstant.lightGray,
                        borderRadius: BorderRadius.circular(10.0),),
                      height: 270.0,
                      child: Center(
                        child: Column(
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 20),
                                child: Text('Mobile Number Verification',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),)
                            ),
                            const Padding(padding: EdgeInsets.only(top: 20),
                                child: Text('An authentication code has been sent to',style: TextStyle(fontSize: 16,color: Color(0xFFA1A1A1)),)
                            ),
                            const Padding(padding: EdgeInsets.only(top: 2),
                                child: Text('+91 1234567890',style: TextStyle(fontSize: 16,color: Color(0xFFA1A1A1)),)
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(50,40,50,0),
                              child: PinCodeTextField(
                                appContext: context,
                                controller: _controller,
                                length: 4,
                                cursorHeight: 19,
                                enableActiveFill: true,
                                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    fieldWidth: 50,
                                    inactiveColor: Colors.grey,
                                    selectedColor: Color(0xFF01B576),
                                    activeFillColor: Colors.white,
                                    selectedFillColor: Colors.white,
                                    inactiveFillColor: Colors.white,
                                    borderWidth: 1,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                onChanged: (String value) {
                                  print(value);
                                },

                              ),),
                            Padding(padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't received the code? ", style: TextStyle(fontSize: 16),),
                                  Text("Resend", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                                ],
                              ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: BestRateColorConstant.lightGray,
                        borderRadius: BorderRadius.circular(10.0),),
                      height: 270.0,
                      child: Center(
                        child: Column(
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 20),
                                child: Text('Email Address Verification',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),)
                            ),
                            const Padding(padding: EdgeInsets.only(top: 20),
                                child: Text('An authentication code has been sent to',style: TextStyle(fontSize: 16,color: Color(0xFFA1A1A1)),)
                            ),
                            const Padding(padding: EdgeInsets.only(top: 2),
                                child: Text('jhon@gmail.com',style: TextStyle(fontSize: 16,color: Color(0xFFA1A1A1)),)
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(50,40,50,0),
                              child: PinCodeTextField(
                                appContext: context,
                                controller: _controller,
                                length: 4,
                                cursorHeight: 19,
                                enableActiveFill: true,
                                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    fieldWidth: 50,
                                    inactiveColor: Colors.grey,
                                    selectedColor: Color(0xFF01B576),
                                    activeFillColor: Colors.white,
                                    selectedFillColor: Colors.white,
                                    inactiveFillColor: Colors.white,
                                    borderWidth: 1,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                onChanged: (String value) {
                                  print(value);
                                },

                              ),),
                            Padding(padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't received the code? ", style: TextStyle(fontSize: 16),),
                                  Text("Resend", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                                ],
                              ),),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(width: 350, height: 55),

                      child: ElevatedButton(
                        child: Text("Submit"),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return DashboardScreen();
                          }));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: BestRateColorConstant.appPrimaryColor,
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
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
