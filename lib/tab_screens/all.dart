import 'package:bestrateapp/constant/best_rate_color_constant.dart';
import 'package:flutter/material.dart';

import '../models/tab_all_model.dart';
class TabAll extends StatefulWidget {
  const TabAll({super.key});

  @override
  State<TabAll> createState() => _TabAllState();
}

class _TabAllState extends State<TabAll> {
  List<TabAllModel> _tabAll = [
    TabAllModel(sellerName: "Abhinav Bhat", businessName: "Nagaranjan PLC", quotedPrice: "9850"),
    TabAllModel(sellerName: "Sumit Singh", businessName: "Wine Shop", quotedPrice: "123425"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: ListView.builder(itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.fromLTRB(20,0,20,20),
              child: Container(
                height: 320,
                decoration: BoxDecoration(
                  color: BestRateColorConstant.cardBg,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20,20,0,0),
                        child: Text("Seller Details", style: TextStyle(fontSize: 14,
                            fontFamily: 'GTWalsheimPro',
                            fontWeight: FontWeight.w700,
                            color: BestRateColorConstant.darkTextBlack),),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,0,20,0),
                      child: Divider(
                        color: BestRateColorConstant.appSecondaryColor,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,20,20,0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Seller Name", style: TextStyle(fontSize: 14,
                                    fontFamily: 'GTWalsheimPro',
                                    fontWeight: FontWeight.w400,
                                    color: BestRateColorConstant.darkTextBlack),),
                              ),
                              Text(_tabAll[index].sellerName.toString(), style: TextStyle(fontSize: 16,
                                  fontFamily: 'GTWalsheimPro',
                                  fontWeight: FontWeight.w700,
                                  color: BestRateColorConstant.darkTextBlack),)
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Business Name", style: TextStyle(fontSize: 14,
                                    fontFamily: 'GTWalsheimPro',
                                    fontWeight: FontWeight.w400,
                                    color: BestRateColorConstant.darkTextBlack),),
                              ),
                              Text(_tabAll[index].businessName.toString(), style: TextStyle(fontSize: 16,
                                  fontFamily: 'GTWalsheimPro',
                                  fontWeight: FontWeight.w700,
                                  color: BestRateColorConstant.darkTextBlack),)
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,20,20,0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Quoted Price", style: TextStyle(fontSize: 14,
                                    fontFamily: 'GTWalsheimPro',
                                    fontWeight: FontWeight.w400,
                                    color: BestRateColorConstant.darkTextBlack),),
                              ),
                              Text(_tabAll[index].quotedPrice.toString(), style: TextStyle(fontSize: 16,
                                  fontFamily: 'GTWalsheimPro',
                                  fontWeight: FontWeight.w700,
                                  color: BestRateColorConstant.darkTextBlack),)
                            ],
                          ),
                          Container(
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                              color: BestRateColorConstant.green,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/download_image.png',width: 24,height: 24,),
                                Text("Download",style: TextStyle(fontSize: 14,
                                    fontFamily: 'GTWalsheimPro',
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),)
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,20,20,0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                                color: BestRateColorConstant.darkTextBlack,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/photo.png',width: 24,height: 24,),
                                Text("Photos",style: TextStyle(fontSize: 14,
                                    fontFamily: 'GTWalsheimPro',
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),)
                              ],
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                                color: BestRateColorConstant.darkTextBlack,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/stars.png',width: 24,height: 24,),
                                Text("Features",style: TextStyle(fontSize: 14,
                                    fontFamily: 'GTWalsheimPro',
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),)
                              ],
                            ),
                          ),
                          Container(
                            width: 110,
                            height: 40,
                            decoration: BoxDecoration(
                                color: BestRateColorConstant.darkTextBlack,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/call.png',width: 24,height: 24,),
                                Text("Contact",style: TextStyle(fontSize: 14,
                                    fontFamily: 'GTWalsheimPro',
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),)
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,20,0,0),
                      child: Row(

                        children: [
                          Container(
                            width: 176,
                            height: 55,
                            decoration: BoxDecoration(
                              color: BestRateColorConstant.green,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                              )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/check_circle.png',width: 24,height: 24,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text("Accept",style: TextStyle(fontSize: 16,
                                      fontFamily: 'GTWalsheimPro',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 176,
                            height: 55,
                            decoration: BoxDecoration(
                                color: BestRateColorConstant.darkRed,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/cancel.png',width: 24,height: 24,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text("Reject",style: TextStyle(fontSize: 16,
                                      fontFamily: 'GTWalsheimPro',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),

              ),
            );
          },
            itemCount: _tabAll.length,
          ),
        ),
      ),
    );
  }
}
