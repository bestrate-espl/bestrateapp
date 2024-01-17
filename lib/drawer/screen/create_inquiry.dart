import 'package:flutter/material.dart';

import '../../constant/best_rate_color_constant.dart';
class CreateInquiry extends StatefulWidget {
  const CreateInquiry({super.key});

  @override
  State<CreateInquiry> createState() => _CreateInquiryState();
}

class _CreateInquiryState extends State<CreateInquiry> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Product", style: TextStyle(fontSize: 18,
                  fontFamily: 'GTWalsheimPro',
                  fontWeight: FontWeight.w500,
                  color: BestRateColorConstant.darkBlack),
              ),
            ),
          ),
          Container(
            child: Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: TextField(
                  cursorColor: BestRateColorConstant.appSecondaryColor,
                  maxLines: 1,
                  keyboardType: TextInputType.name,
                  style: TextStyle(fontFamily: 'GTWalsheimPro',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: BestRateColorConstant.darkBlack),
                  decoration: InputDecoration(
                      hintText: "Search...",
                      prefixIcon: Image.asset('assets/images/search_icon.png'),
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

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Quality", style: TextStyle(fontSize: 18,
                    fontFamily: 'GTWalsheimPro',
                    fontWeight: FontWeight.w500,
                    color: BestRateColorConstant.darkBlack),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: TextField(
                  cursorColor: BestRateColorConstant.appSecondaryColor,
                  maxLines: 1,
                  keyboardType: TextInputType.name,
                  style: TextStyle(fontFamily: 'GTWalsheimPro',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: BestRateColorConstant.darkBlack),
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
                )
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Description", style: TextStyle(fontSize: 18,
                    fontFamily: 'GTWalsheimPro',
                    fontWeight: FontWeight.w500,
                    color: BestRateColorConstant.darkBlack),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: TextField(
                  minLines: 1,
                  maxLines: 10,
                  cursorColor: BestRateColorConstant.appSecondaryColor,
                  keyboardType: TextInputType.name,
                  style: TextStyle(
                      fontFamily: 'GTWalsheimPro',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: BestRateColorConstant.darkBlack),
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
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Upload Photo(s)", style: TextStyle(fontSize: 18,
                    fontFamily: 'GTWalsheimPro',
                    fontWeight: FontWeight.w500,
                    color: BestRateColorConstant.darkBlack),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: 332,
                child: Padding(padding: EdgeInsets.fromLTRB(20, 10, 5, 0),
                    child: TextField(
                      minLines: 1,
                      cursorColor: BestRateColorConstant.appSecondaryColor,
                      keyboardType: TextInputType.name,
                      style: TextStyle(
                          fontFamily: 'GTWalsheimPro',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: BestRateColorConstant.darkBlack),
                      decoration: InputDecoration(
                          hintText: "Browse",
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
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset('assets/images/file_icon.png'),
              ),

            ],
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 350, height: 55),

              child: ElevatedButton(
                child: Text("Sign Up"),

                onPressed: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context){
                  //   return RegistrationScreen();
                  // },),);
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
        ],
      ),
    );
  }
}
