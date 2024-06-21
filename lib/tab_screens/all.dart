import 'dart:ffi';

import 'package:bestrateapp/constant/best_rate_color_constant.dart';
import 'package:bestrateapp/models/buyer_inquiries_details_model.dart';
import 'package:bestrateapp/providers/buyer_inquiries_provider.dart';
import 'package:fl_downloader/fl_downloader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/tab_all_model.dart';
import '../sharedpreference/SharedPreferenceHelper.dart';
import '../sharedpreference/sharedpreference_constant.dart';
class TabAll extends StatefulWidget {
  final BuyerInquiriesDetailsModel? inquiriesDetailsModel;
  final int inquiriesId;
  const TabAll({super.key, required this.inquiriesDetailsModel, required this.inquiriesId});

  @override
  State<TabAll> createState() => _TabAllState();
}

class _TabAllState extends State<TabAll> {
  String? token, buyerId;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async{
      token = await SharedPreferenceHelper.getData(SharedPreferenceConstant.USER_TOKEN);
      buyerId = await SharedPreferenceHelper.getData(SharedPreferenceConstant.PROFILE_ID);
      setState(() {});
    });

  }
  @override
  Widget build(BuildContext context) {
    return Consumer<BuyerInquiriesProvider>(builder: (context,inquiriesAllProvider,_) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              SafeArea(
                child: Center(
                  child: inquiriesAllProvider.buyerInquiriesDetailsModel?.pending?.isNotEmpty ?? false ? ListView.builder(
                    itemCount: inquiriesAllProvider.buyerInquiriesDetailsModel?.pending?.length,
                    itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20,0,20,20),
                      child: Container(
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
                                      Text("${inquiriesAllProvider.buyerInquiriesDetailsModel?.pending?[index].firstName} "
                                          "${inquiriesAllProvider.buyerInquiriesDetailsModel?.pending?[index].lastName}", style: const TextStyle(fontSize: 16,
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
                                      Text("${inquiriesAllProvider.buyerInquiriesDetailsModel?.pending?[index].businessName}", style: const TextStyle(fontSize: 16,
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
                                      Text("₹${inquiriesAllProvider.buyerInquiriesDetailsModel?.pending?[index].quotedPrice}", style: const TextStyle(fontSize: 16,
                                          fontFamily: 'GTWalsheimPro',
                                          fontWeight: FontWeight.w700,
                                          color: BestRateColorConstant.darkTextBlack),)
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () async{
                                      var permission = await FlDownloader.requestPermission();
                                      if (permission == StoragePermissionStatus.granted){
                                        await FlDownloader.download(inquiriesAllProvider.buyerInquiriesDetailsModel?.pending?[index].quotationFiles ?? "");
                                        inquiriesAllProvider.getDownload();
                                      }
                                    },
                                    child: Container(
                                      width: 120,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: BestRateColorConstant.green,
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      child:inquiriesAllProvider.progress != 0 ? const SizedBox(
                                          height: 5,
                                          width: 5,
                                          child: Center(
                                              child: CircularProgressIndicator())) : Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/images/download_image.png',width: 24,height: 24,),
                                          const Text("Download",style: TextStyle(fontSize: 14,
                                              fontFamily: 'GTWalsheimPro',
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),)
                                        ],
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            ),
                            /*Padding(
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
                            ),*/
                            Padding(
                              padding:  const EdgeInsets.fromLTRB(0,20,0,0),
                              child: Row(

                                children: [
                                  GestureDetector(
                                    onTap : (){
                                      var buyer_id = int.parse(buyerId!);
                                      var inqId = inquiriesAllProvider.buyerInquiriesDetailsModel?.pending?[index].id;
                                      getAcceptQuotation(token!, buyer_id, widget.inquiriesId, inqId!);
                                    },
                                    child: Container(
                                      width: 185,
                                      height: 55,
                                      decoration:  const BoxDecoration(
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
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      var buyer_id = int.parse(buyerId!);
                                      var inqId = inquiriesAllProvider.buyerInquiriesDetailsModel?.pending?[index].id;
                                      getAcceptQuotation(token!, buyer_id, widget.inquiriesId, inqId!);
                                    },
                                    child: Container(
                                      width: 185,
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
              if (inquiriesAllProvider.isLoading)
                Container(
                  // width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        );
      }
    );
  }

  Future<void> getAcceptQuotation(String token, int buyerId, int inquiriesId, int acceptInquiriesId) async{
    final acceptProvider = Provider.of<BuyerInquiriesProvider>(context, listen: false);
    await acceptProvider.getAcceptQuotation(token, buyerId, inquiriesId,acceptInquiriesId);

  }

  Future<void> getRejectQuotation(String token, int buyerId, int inquiriesId, int acceptInquiriesId) async{
    final acceptProvider = Provider.of<BuyerInquiriesProvider>(context, listen: false);
    await acceptProvider.getRejectQuotation(token, buyerId, inquiriesId,acceptInquiriesId);

  }
}
