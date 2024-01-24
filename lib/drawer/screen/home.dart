import 'package:bestrateapp/constant/best_rate_color_constant.dart';
import 'package:bestrateapp/drawer/screen/view_inquiry_details.dart';
import 'package:bestrateapp/models/last_inquiries_model.dart';
import 'package:flutter/material.dart';

import '../../models/inquiries_model.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<LastInquiriesModel> lastInquiries = [
  LastInquiriesModel(inqId: "INQ123650", qty: "1000", dayTime: "04-12-2023, 11:50AM"),
  LastInquiriesModel(inqId: "INQ123651", qty: "500", dayTime: "06-12-2023, 10:00AM"),
  ];
  
  List<InquiriesModel> inqModel = [
    InquiriesModel(inquiriesName: "Paper"),
    InquiriesModel(inquiriesName: "Tissue Paper"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 180,
                        height: 110,
                        decoration: BoxDecoration(
                            color: BestRateColorConstant.green,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10,10,0,0),
                              child: Column(
                                children: [
                                  Container(
                                    width: 100,
                                      child: Text("Inquiries Generated", style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'GTWalsheimPro',
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white
                                      ),)
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Container(
                                        width: 100,
                                        child: Text("07", style: TextStyle(
                                            fontSize: 34,
                                            fontFamily: 'GTWalsheimPro',
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),)
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(0),
                            child: Container(
                              width: 60,
                              child: Image.asset('assets/images/list_alt.png'),
                            ),)
                          ],
                        ),

                      ),
                      Container(
                        width: 180,
                        height: 110,
                        decoration: BoxDecoration(
                            color: BestRateColorConstant.green,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10,10,0,0),
                              child: Column(
                                children: [
                                  Container(
                                      width: 70,
                                      child: Text("Latest Bids", style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'GTWalsheimPro',
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),)
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Container(
                                        width: 100,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Text("05", style: TextStyle(
                                              fontSize: 34,
                                              fontFamily: 'GTWalsheimPro',
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),),
                                        )
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(0),
                              child: Container(
                                width: 60,
                                child: Image.asset('assets/images/lab_profile.png'),
                              ),)
                          ],
                        ),

                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text("Last Inquiries", style: TextStyle(fontSize: 18,
                        fontFamily: 'GTWalsheimPro',
                        fontWeight: FontWeight.w700,
                        color: BestRateColorConstant.darkBlack ),),
                  ),
                ),
                Expanded(
                  child: ListView.builder(itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                            color: BestRateColorConstant.green,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return ViewInquiryDetails();
                                }));
                            },
                              child: Container(
                                width: 350,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: BestRateColorConstant.cardBg,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20)
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(lastInquiries[index].inqId.toString(), style: TextStyle(fontSize: 14,
                                              fontFamily: 'GTWalsheimPro',
                                              fontWeight: FontWeight.w700,
                                              color: BestRateColorConstant.darkBlack),),
                                          Image.asset('assets/images/notification_icon.png')
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(5,0,5,0),
                                      child: Container(
                                        height: 35,
                                        child: ListView.builder(itemBuilder: (context, index) {
                                           return Padding(
                                             padding: const EdgeInsets.all(1),
                                             child: Container(
                                               decoration: BoxDecoration(
                                               color: BestRateColorConstant.darkBlack,
                                               borderRadius: BorderRadius.circular(16)
                                        ),
                                               child: Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Text(inqModel[index].inquiriesName.toString(), style: TextStyle(fontSize: 12,
                                                     fontFamily: 'GTWalsheimPro',
                                                     fontWeight: FontWeight.w400,
                                                     color: Colors.white),),
                                               ),
                                        ),
                                           );
                                      },
                                      itemCount: inqModel.length,
                                      scrollDirection: Axis.horizontal,),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Qty: "+lastInquiries[index].qty.toString(), style: TextStyle(fontSize: 14,
                                            fontFamily: 'GTWalsheimPro',
                                            fontWeight: FontWeight.w700,
                                            color: BestRateColorConstant.darkBlack),),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(lastInquiries[index].dayTime.toString(), style: TextStyle(fontSize: 12,
                                            fontFamily: 'GTWalsheimPro',
                                            fontWeight: FontWeight.w400,
                                            color: BestRateColorConstant.darkBlack),),
                                      ),
                                    )
                                  ],
                                ),

                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                                child: Image.asset('assets/images/keyboard_arrow_right.png')),
                          ],
                        ),
                      ),
                    );
                  },
                    itemCount: lastInquiries.length,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
