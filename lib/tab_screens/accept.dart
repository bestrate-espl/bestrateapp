import 'package:bestrateapp/constant/best_rate_color_constant.dart';
import 'package:bestrateapp/providers/buyer_inquiries_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/buyer_inquiries_details_model.dart';
import '../models/tab_all_model.dart';
class TabAccept extends StatefulWidget {
  final BuyerInquiriesDetailsModel? inquiriesDetailsModel;
  const TabAccept({super.key, required this.inquiriesDetailsModel});

  @override
  State<TabAccept> createState() => _TabAcceptState();
}

class _TabAcceptState extends State<TabAccept> {
  List<TabAllModel> _tabAll = [
    TabAllModel(sellerName: "Abhinav Bhat", businessName: "Nagaranjan PLC", quotedPrice: "9850"),
    TabAllModel(sellerName: "Sumit Singh", businessName: "Wine Shop", quotedPrice: "123425"),
  ];
  @override
  Widget build(BuildContext context) {
    return  Consumer<BuyerInquiriesProvider>(builder: (context,inquiriesAllProvider,_) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Center(
                child: inquiriesAllProvider.buyerInquiriesDetailsModel?.accepted?.isNotEmpty ?? false ? ListView.builder(
                  itemCount: inquiriesAllProvider.buyerInquiriesDetailsModel?.accepted?.length,
                  itemBuilder: (context, index){
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
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20,20,0,0),
                                child: Text("Seller Details", style: TextStyle(fontSize: 14,
                                    fontFamily: 'GTWalsheimPro',
                                    fontWeight: FontWeight.w700,
                                    color: BestRateColorConstant.darkTextBlack),),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(20,0,20,0),
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
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Seller Name", style: TextStyle(fontSize: 14,
                                            fontFamily: 'GTWalsheimPro',
                                            fontWeight: FontWeight.w400,
                                            color: BestRateColorConstant.darkTextBlack),),
                                      ),
                                      Text(_tabAll[index].sellerName.toString(), style: const TextStyle(fontSize: 16,
                                          fontFamily: 'GTWalsheimPro',
                                          fontWeight: FontWeight.w700,
                                          color: BestRateColorConstant.darkTextBlack),)
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Business Name", style: TextStyle(fontSize: 14,
                                            fontFamily: 'GTWalsheimPro',
                                            fontWeight: FontWeight.w400,
                                            color: BestRateColorConstant.darkTextBlack),),
                                      ),
                                      Text(_tabAll[index].businessName.toString(), style: const TextStyle(fontSize: 16,
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
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("Quoted Price", style: TextStyle(fontSize: 14,
                                            fontFamily: 'GTWalsheimPro',
                                            fontWeight: FontWeight.w400,
                                            color: BestRateColorConstant.darkTextBlack),),
                                      ),
                                      Text(_tabAll[index].quotedPrice.toString(), style: const TextStyle(fontSize: 16,
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
                                        const Text("Download",style: TextStyle(fontSize: 14,
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
                                        const Text("Photos",style: TextStyle(fontSize: 14,
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
                                        const Text("Features",style: TextStyle(fontSize: 14,
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
                                        const Text("Contact",style: TextStyle(fontSize: 14,
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
                                    decoration: const BoxDecoration(
                                        color: BestRateColorConstant.green,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                        )
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/images/check_circle.png',width: 24,height: 24,),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 5.0),
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
                                    decoration: const BoxDecoration(
                                        color: BestRateColorConstant.darkRed,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20),
                                        )
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/images/cancel.png',width: 24,height: 24,),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 5.0),
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

                ): const Center(
                  child: Text("No data found"),
                )
            ),
          ),
        );
      }
    );
  }
}
