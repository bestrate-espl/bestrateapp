import 'package:bestrateapp/providers/buyer_inquiries_provider.dart';
import 'package:bestrateapp/sharedpreference/SharedPreferenceHelper.dart';
import 'package:bestrateapp/sharedpreference/sharedpreference_constant.dart';
import 'package:bestrateapp/tab_screens/accept.dart';
import 'package:bestrateapp/tab_screens/all.dart';
import 'package:bestrateapp/tab_screens/reject.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/best_rate_color_constant.dart';
import '../../models/inquiries_model.dart';
class ViewInquiryDetails extends StatefulWidget {
  final int inquiriesId;
  const ViewInquiryDetails({super.key, required this.inquiriesId});

  @override
  State<ViewInquiryDetails> createState() => _ViewInquiryDetailsState();
}

class _ViewInquiryDetailsState extends State<ViewInquiryDetails> with SingleTickerProviderStateMixin {
  String? token, buyerId;

  late TabController _tabController;
  final List<Tab> _tabs = [
    Tab(text: "All"),
    Tab(text: "Accept"),
    Tab(text: "Reject"),
  ];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async{
      token = await SharedPreferenceHelper.getData(SharedPreferenceConstant.USER_TOKEN);
      buyerId = await SharedPreferenceHelper.getData(SharedPreferenceConstant.BUYER_ID);
      var bId = int.parse(buyerId!);
      getInquiriesDetails(token!, bId, widget.inquiriesId);
      _tabController = TabController(length: 3, vsync: this);
      setState(() {});
    });

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BuyerInquiriesProvider>(builder: (context, inquiriesDetailsProvider,_) {
        return Scaffold(
          backgroundColor: Colors.white,
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
                      child: Padding(padding: const EdgeInsets.all(10),
                        child: Image.asset('assets/images/arrow_back_image.png'),
                      ),
                    ),
                    const Expanded(child: Center(
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
                            height: 425,
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
                                      Text("INQ ${widget.inquiriesId}", style: const TextStyle(fontSize: 14,
                                          fontFamily: 'GTWalsheimPro',
                                          fontWeight: FontWeight.w700,
                                          color: BestRateColorConstant.darkBlack),),
                                      const Text("04-12-2023, 11:50AM", style: TextStyle(fontSize: 12,
                                          fontFamily: 'GTWalsheimPro',
                                          fontWeight: FontWeight.w400,
                                          color: BestRateColorConstant.darkBlack),),
                                    ],
                                  ),
                                  const Divider(
                                    color: BestRateColorConstant.appSecondaryColor,
                                    thickness: 1,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      children: [
                                        const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text("Products", style: TextStyle(fontSize: 14,
                                                fontFamily: 'GTWalsheimPro',
                                                fontWeight: FontWeight.w400,
                                                color: BestRateColorConstant.darkBlack)),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(5,0,5,0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: BestRateColorConstant.darkBlack,
                                                  borderRadius: BorderRadius.circular(16)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text("${inquiriesDetailsProvider.buyerInquiriesDetailsModel?.inquiry?.keyword}", style: const TextStyle(fontSize: 12,
                                                    fontFamily: 'GTWalsheimPro',
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white),),
                                              ),
                                            )
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(10,5,0,0),
                                          child: Container(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    const Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Text("Qty",style: TextStyle(fontSize: 14,
                                                          fontFamily: 'GTWalsheimPro',
                                                          fontWeight: FontWeight.w400,
                                                          color: BestRateColorConstant.darkBlack)),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(5,0,0,0),
                                                      child: Text("${inquiriesDetailsProvider.buyerInquiriesDetailsModel?.inquiry?.quantity}",
                                                          style: const TextStyle(fontSize: 16,
                                                          fontFamily: 'GTWalsheimPro',
                                                          fontWeight: FontWeight.w700,
                                                          color: BestRateColorConstant.darkBlack)),
                                                    )
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(right: 30),
                                                  child: Column(
                                                    children: [
                                                      const Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text("Budget",style: TextStyle(fontSize: 14,
                                                            fontFamily: 'GTWalsheimPro',
                                                            fontWeight: FontWeight.w400,
                                                            color: BestRateColorConstant.darkBlack)),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(top: 5),
                                                        child: Text("${inquiriesDetailsProvider.buyerInquiriesDetailsModel?.inquiry?.budgetStart} ${"-"} "
                                                            "${inquiriesDetailsProvider.buyerInquiriesDetailsModel?.inquiry?.budgetEnd}",
                                                            style: const TextStyle(fontSize: 16,
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
                                            child:  Column(
                                              children: [
                                                const Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Text("Description",style: TextStyle(fontSize: 14,
                                                      fontFamily: 'GTWalsheimPro',
                                                      fontWeight: FontWeight.w400,
                                                      color: BestRateColorConstant.darkBlack)),
                                                ),
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(top: 5),
                                                    child: Text("${inquiriesDetailsProvider.buyerInquiriesDetailsModel?.inquiry?.description}",
                                                        style: const TextStyle(fontSize: 16,
                                                        fontFamily: 'GTWalsheimPro',
                                                        fontWeight: FontWeight.w700,
                                                        color: BestRateColorConstant.darkBlack)),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
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
                                            child: ListView.builder(
                                              itemCount: inquiriesDetailsProvider.buyerInquiriesDetailsModel?.inquiry?.inquiryFile?.length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                String imageUrl = "${inquiriesDetailsProvider.buyerInquiriesDetailsModel?.base}${"/"}${inquiriesDetailsProvider.buyerInquiriesDetailsModel?.inquiry?.inquiryFile?[index].file}";
                                                print("image Url : $imageUrl");
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
                                                    child: Image.network(imageUrl),
                                                  ),
                                                ),
                                              );
                                            },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20,0,20,0),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: BestRateColorConstant.lightGray,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)
                                  )
                                ),

                                child: TabBar(
                                  controller: _tabController,
                                  labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700,fontFamily: 'GTWalsheimPro',color: Colors.white),
                                  unselectedLabelColor: BestRateColorConstant.appSecondaryColor,
                                  tabs: _tabs,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  indicator: const BoxDecoration(
                                    color: BestRateColorConstant.appPrimaryColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)
                                    )
                                  ),
                                ),
                              ),
                            ),
                          ]
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 3,
                          color: BestRateColorConstant.appPrimaryColor,
                        ),
                        Container(
                          height: 300,
                          child: TabBarView(
                            controller: _tabController,
                            children:  [
                              TabAll(inquiriesDetailsModel: inquiriesDetailsProvider.buyerInquiriesDetailsModel,),
                              TabAccept(),
                              TabReject()
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        );
      }
    );
  }
  
  Future<void> getInquiriesDetails(String token, int buyerId, int inquiriesId) async{
    final inquiriesDetailsProvider = Provider.of<BuyerInquiriesProvider>(context, listen: false);
    inquiriesDetailsProvider.getBuyerInquiriesDetails(token, buyerId, inquiriesId);
  }
}
