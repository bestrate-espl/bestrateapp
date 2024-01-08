import 'package:flutter/material.dart';

import '../../constant/best_rate_color_constant.dart';
import '../../models/inquiries_model.dart';
import '../../models/last_inquiries_model.dart';
class MyInquiry extends StatefulWidget {
  const MyInquiry({super.key});

  @override
  State<MyInquiry> createState() => _MyInquiryState();
}

class _MyInquiryState extends State<MyInquiry> {
  List<LastInquiriesModel> lastInquiries = [
    LastInquiriesModel(inqId: "INQ123650", qty: "1000", dayTime: "04-12-2023, 11:50AM"),
    LastInquiriesModel(inqId: "INQ123651", qty: "500", dayTime: "06-12-2023, 10:00AM"),
    LastInquiriesModel(inqId: "INQ123652", qty: "5000", dayTime: "09-12-2023, 11:00AM"),
    LastInquiriesModel(inqId: "INQ123653", qty: "6700", dayTime: "16-12-2023, 01:00PM"),
    LastInquiriesModel(inqId: "INQ123654", qty: "67400", dayTime: "18-12-2023, 04:00PM"),
    LastInquiriesModel(inqId: "INQ123655", qty: "670440", dayTime: "26-12-2023, 08:00PM"),
  ];

  List<InquiriesModel> inqModel = [
    InquiriesModel(inquiriesName: "Paper"),
    InquiriesModel(inquiriesName: "Tissue Paper"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        children: [
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
                          // Navigator.push(context, MaterialPageRoute(builder: (context){
                          //   return ViewInquiryDetails();
                          // }));
                        },
                        child: Container(
                          width: 370,
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
                                      padding: const EdgeInsets.all(3),
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
          ),
        ],
      ),
    );
  }
}
