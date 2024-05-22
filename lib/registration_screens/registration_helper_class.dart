import 'package:bestrateapp/otp_screens/otp_registration_screen.dart';
import 'package:bestrateapp/page_route/route_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';

import '../constant/best_rate_color_constant.dart';
import '../controller/registration_controller.dart';

class BuyerInformationScreen extends StatefulWidget {
  const BuyerInformationScreen({super.key});

  @override
  State<BuyerInformationScreen> createState() => _BuyerInformationScreenState();
}

class _BuyerInformationScreenState extends State<BuyerInformationScreen> {
  final registrationController = Get.find<RegistrationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text("1. Buyer Information Details", style: TextStyle(fontSize: 18,
                  fontFamily: 'GTWalsheimPro',
                  fontWeight: FontWeight.w700,
                  color: BestRateColorConstant.darkBlack),),
            ),
          ),
          Expanded(child:  SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Center(
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(top: 30),
                  //     child: Text("1. Buyer Information Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,30,20,0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 170,
                            child: Text("First Name", style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'GTWalsheimPro',
                                fontWeight: FontWeight.w500,
                                color: BestRateColorConstant.darkBlack),)),
                        Container(
                            width: 170,
                            child: Text("Last Name", style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'GTWalsheimPro',
                                fontWeight: FontWeight.w500,
                                color: BestRateColorConstant.darkBlack)))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,10,20,0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 170,
                            child: TextField(
                              cursorColor: BestRateColorConstant.appSecondaryColor,
                              maxLines: 1,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  hintText: "Enter",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: BestRateColorConstant.appSecondaryColor)
                                  )
                              ),
                            )),

                        Container(
                            width: 170,
                            child: TextField(
                              cursorColor: BestRateColorConstant.appSecondaryColor,
                              maxLines: 1,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  hintText: "Enter",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: BestRateColorConstant.appSecondaryColor)
                                  )
                              ),
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,30,20,0),
                    child: Row(
                      children: [
                        Container(
                            child: Text("Email Address*", style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'GTWalsheimPro',
                                fontWeight: FontWeight.w500,
                                color: BestRateColorConstant.darkBlack),)),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,10,20,0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                              child: TextField(
                                cursorColor: BestRateColorConstant.appSecondaryColor,
                                maxLines: 1,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    hintText: "Enter",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: BestRateColorConstant.appSecondaryColor)
                                    )
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,30,20,0),
                    child: Row(
                      children: [
                        Container(
                            child: Text("Mobile Number*", style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'GTWalsheimPro',
                                fontWeight: FontWeight.w500,
                                color: BestRateColorConstant.darkBlack),)),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,10,20,0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                              child: TextField(
                                cursorColor: BestRateColorConstant.appSecondaryColor,
                                maxLines: 1,
                                maxLength: 10,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: "Enter",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: BestRateColorConstant.appSecondaryColor)
                                    )
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,10,20,0),
                    child: Row(
                      children: [
                        Container(
                            child: Text("Area*", style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'GTWalsheimPro',
                                fontWeight: FontWeight.w500,
                                color: BestRateColorConstant.darkBlack),)),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,10,20,0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                              child: TextField(
                                cursorColor: BestRateColorConstant.appSecondaryColor,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    suffixIcon: Image.asset('assets/images/arrow_drop_down_circle.png'),
                                    hintText: "Enter",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: BestRateColorConstant.appSecondaryColor)
                                    )
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,30,20,0),
                    child: Row(
                      children: [
                        Container(
                            child: Text("Pin Code*", style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'GTWalsheimPro',
                                fontWeight: FontWeight.w500,
                                color: BestRateColorConstant.darkBlack),)),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,10,20,0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                              child: TextField(
                                cursorColor: BestRateColorConstant.appSecondaryColor,
                                maxLines: 1,
                                maxLength: 6,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: "Enter",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: BestRateColorConstant.appSecondaryColor)
                                    )
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20,30,20,20),
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 370, height: 55),

                        child: ElevatedButton(
                          child: Text("Next", style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'GTWalsheimPro',
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                          ),),

                          onPressed: () {
                            registrationController.updateRegistrationPage(1);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF7258DB),
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
                  )
                ],
              ),
            ),
          ),)

        ],
      ),
    );
  }
}

class BusinessDetails extends StatefulWidget {
  const BusinessDetails({super.key});

  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  final registrationController = Get.find<RegistrationController>();

  String selectedValue = 'Option 1';
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text("2. Business Details", style: TextStyle(fontSize: 18,
                      fontFamily: 'GTWalsheimPro',
                      fontWeight: FontWeight.w700,
                      color: BestRateColorConstant.darkBlack),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,30,20,0),
                      child: Row(
                        children: [
                          Container(
                              child: Text("Are you a Business?", style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'GTWalsheimPro',
                                  fontWeight: FontWeight.w500,
                                  color: BestRateColorConstant.darkBlack),)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,0,20,0),
                      child: Container(
                        child: Row(
                          children: [
                            // Radio button for Option 1
                            Radio(
                              value: 'Yes',
                              groupValue: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value!;
                                });
                              },
                              activeColor: Colors.black,
                            ),
                            Text('Yes', style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'GTWalsheimPro',
                                fontWeight: FontWeight.w500,
                                color: BestRateColorConstant.darkBlack),),

                            // Radio button for Option 2
                            Radio(
                              value: 'No',
                              groupValue: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value!;
                                });
                              },
                              activeColor: Colors.black,
                            ),
                            Text('No' , style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'GTWalsheimPro',
                                fontWeight: FontWeight.w500,
                                color: BestRateColorConstant.darkBlack),),

                            // Display the selected value
                            // SizedBox(width: 20.0),
                            // Text('Selected Value: $selectedValue'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,20,20,0),
                      child: Row(
                        children: [
                          Container(
                              child: Text("Business Name", style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'GTWalsheimPro',
                                  fontWeight: FontWeight.w500,
                                  color: BestRateColorConstant.darkBlack),)),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,10,20,0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                                child: TextField(
                                  cursorColor: BestRateColorConstant.appSecondaryColor,
                                  maxLines: 1,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                      hintText: "Enter",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: BestRateColorConstant.appSecondaryColor)
                                      )
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,30,20,0),
                      child: Row(
                        children: [
                          Container(
                              child: Text("GSTIN", style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'GTWalsheimPro',
                                  fontWeight: FontWeight.w500,
                                  color: BestRateColorConstant.darkBlack),)),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,10,20,0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                                child: TextField(
                                  cursorColor: BestRateColorConstant.appSecondaryColor,
                                  maxLines: 1,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: "Enter",
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: BestRateColorConstant.appSecondaryColor)
                                      )
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          // Checkbox
                          Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                            activeColor: Colors.black,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'I agree to the ',
                                  style: TextStyle(fontSize: 14,
                                      fontFamily: 'GTWalsheimPro',
                                      fontWeight: FontWeight.w400,
                                      color: BestRateColorConstant.darkBlack),
                                ),
                                TextSpan(
                                  text: 'Terms of Use',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'GTWalsheimPro',
                                    fontWeight: FontWeight.w400,
                                    color: BestRateColorConstant.appPrimaryColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                  // Add a gesture recognizer for the privacy policy link
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Handle tap on privacy policy link
                                      print('Terms of Use tapped!');
                                      // Add your navigation logic here if you want to navigate to the privacy policy page
                                    },
                                ),
                                TextSpan(
                                  text: ' and ',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'GTWalsheimPro',
                                      fontWeight: FontWeight.w400,
                                      color: BestRateColorConstant.darkBlack
                                  ),
                                ),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'GTWalsheimPro',
                                    fontWeight: FontWeight.w400,
                                    color: BestRateColorConstant.appPrimaryColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                  // Add a gesture recognizer for the terms of service link
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Handle tap on terms of service link
                                      print('Privacy Policy tapped!');
                                      // Add your navigation logic here if you want to navigate to the terms of service page
                                    },
                                ),
                              ],
                            ),
                          ),

                          // Display the checkbox state
                          // SizedBox(height: 20.0),
                          // Text('Checkbox State: $isChecked'),
                        ],
                      ),
                    ),

                    Container(

                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20,60,20,20),
                        child: ConstrainedBox(
                          constraints: BoxConstraints.tightFor(width: 370, height: 55),

                          child: ElevatedButton(
                            child: Text("Sign Up",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'GTWalsheimPro',
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),),

                            onPressed: () {
                              context.goNamed(MyApplicationRouteConstant.OTP_REGISTRATION_SCREEN);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF7258DB),
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

