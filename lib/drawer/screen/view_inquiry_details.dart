import 'package:flutter/material.dart';

import '../../constant/best_rate_color_constant.dart';
import '../../models/inquiries_model.dart';
class ViewInquiryDetails extends StatefulWidget {
  const ViewInquiryDetails({super.key});

  @override
  State<ViewInquiryDetails> createState() => _ViewInquiryDetailsState();
}

class _ViewInquiryDetailsState extends State<ViewInquiryDetails> {
  List<InquiriesModel> inqModel = [
    InquiriesModel(inquiriesName: "Paper"),
    InquiriesModel(inquiriesName: "Tissue Paper"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50.0),
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
                    child: Text("View Inquiry Details", style: TextStyle(fontSize: 20,
                        fontFamily: 'GTWalsheimPro',
                        fontWeight: FontWeight.w700,
                        color: BestRateColorConstant.darkBlack),),),
                ),
                ),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        height: 385,
                        decoration: BoxDecoration(
                            color: BestRateColorConstant.cardBg,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("INQ123650", style: TextStyle(fontSize: 14,
                                      fontFamily: 'GTWalsheimPro',
                                      fontWeight: FontWeight.w700,
                                      color: BestRateColorConstant.darkBlack),),
                                  Text("04-12-2023, 11:50AM", style: TextStyle(fontSize: 12,
                                      fontFamily: 'GTWalsheimPro',
                                      fontWeight: FontWeight.w400,
                                      color: BestRateColorConstant.darkBlack),),
                                ],
                              ),
                              Divider(
                                color: BestRateColorConstant.appSecondaryColor,
                                thickness: 1,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Products", style: TextStyle(fontSize: 14,
                                            fontFamily: 'GTWalsheimPro',
                                            fontWeight: FontWeight.w400,
                                            color: BestRateColorConstant.darkBlack)),
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
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text("Qty",style: TextStyle(fontSize: 14,
                                                      fontFamily: 'GTWalsheimPro',
                                                      fontWeight: FontWeight.w400,
                                                      color: BestRateColorConstant.darkBlack)),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(5,0,0,0),
                                                  child: Text("1000",style: TextStyle(fontSize: 16,
                                                      fontFamily: 'GTWalsheimPro',
                                                      fontWeight: FontWeight.w700,
                                                      color: BestRateColorConstant.darkBlack)),
                                                )
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 30),
                                              child: Column(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Text("Budget",style: TextStyle(fontSize: 14,
                                                        fontFamily: 'GTWalsheimPro',
                                                        fontWeight: FontWeight.w400,
                                                        color: BestRateColorConstant.darkBlack)),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 5),
                                                    child: Text("10000-20000",style: TextStyle(fontSize: 16,
                                                        fontFamily: 'GTWalsheimPro',
                                                        fontWeight: FontWeight.w700,
                                                        color: BestRateColorConstant.darkBlack)),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text("Discription",style: TextStyle(fontSize: 14,
                                                  fontFamily: 'GTWalsheimPro',
                                                  fontWeight: FontWeight.w400,
                                                  color: BestRateColorConstant.darkBlack)),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 5),
                                                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna. ",style: TextStyle(fontSize: 16,
                                                    fontFamily: 'GTWalsheimPro',
                                                    fontWeight: FontWeight.w700,
                                                    color: BestRateColorConstant.darkBlack)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Photos", style: TextStyle(fontSize: 14,
                                            fontFamily: 'GTWalsheimPro',
                                            fontWeight: FontWeight.w400,
                                            color: BestRateColorConstant.darkBlack)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(5,0,5,0),
                                      child: Container(
                                        height: 80,
                                        child: ListView.builder(itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(3),
                                            child: Container(
                                              height: 80,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
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
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
