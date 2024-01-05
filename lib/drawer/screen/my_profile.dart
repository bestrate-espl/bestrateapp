import 'package:flutter/material.dart';

import '../../constant/best_rate_color_constant.dart';
class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String selectedValue = 'Option 1';
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,30,20,0),
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
                    padding: const EdgeInsets.fromLTRB(5,0,20,0),
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
                          Text('No' , style: TextStyle(fontSize: 18,
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
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20,30,20,20),
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 370, height: 55),

                        child: ElevatedButton(
                          child: Text("Submit", style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'GTWalsheimPro',
                              fontWeight: FontWeight.w500,
                              color: Colors.white
                          ),),

                          onPressed: () {

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
          ),
          )

        ],
      ),
    );
  }
}
