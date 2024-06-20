import 'package:fl_downloader/fl_downloader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/best_rate_color_constant.dart';
import '../providers/buyer_inquiries_provider.dart';
import '../sharedpreference/SharedPreferenceHelper.dart';
import '../sharedpreference/sharedpreference_constant.dart';
class TabReject extends StatefulWidget {
  const TabReject({super.key});

  @override
  State<TabReject> createState() => _TabRejectState();
}

class _TabRejectState extends State<TabReject> {
  String? token, buyerId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
      token =
      await SharedPreferenceHelper.getData(SharedPreferenceConstant.USER_TOKEN);
      buyerId =
      await SharedPreferenceHelper.getData(SharedPreferenceConstant.BUYER_ID);
      var bId = int.parse(buyerId!);
      getRejectInquiries(token!, bId);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BuyerInquiriesProvider>(
        builder: (context, inquiriesAllProvider, _) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Stack(
                children: [
                  Center(
                      child: inquiriesAllProvider.rejectInquiriesModel?.rejectedInquiries?.isNotEmpty ?? false ? ListView
                          .builder(
                        itemCount: inquiriesAllProvider.rejectInquiriesModel?.rejectedInquiries?.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
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
                                      padding: EdgeInsets.fromLTRB(
                                          20, 20, 0, 0),
                                      child: Text("Seller Details",
                                        style: TextStyle(fontSize: 14,
                                            fontFamily: 'GTWalsheimPro',
                                            fontWeight: FontWeight.w700,
                                            color: BestRateColorConstant
                                                .darkTextBlack),),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: Divider(
                                      color: BestRateColorConstant
                                          .appSecondaryColor,
                                      thickness: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 20, 20, 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            const Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text("Seller Name",
                                                style: TextStyle(fontSize: 14,
                                                    fontFamily: 'GTWalsheimPro',
                                                    fontWeight: FontWeight.w400,
                                                    color: BestRateColorConstant
                                                        .darkTextBlack),),
                                            ),
                                            Text("${inquiriesAllProvider.rejectInquiriesModel?.rejectedInquiries?[index].firstName} ${inquiriesAllProvider.rejectInquiriesModel?.rejectedInquiries?[index].lastName}",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'GTWalsheimPro',
                                                  fontWeight: FontWeight.w700,
                                                  color: BestRateColorConstant
                                                      .darkTextBlack),)
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            const Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text("Business Name",
                                                style: TextStyle(fontSize: 14,
                                                    fontFamily: 'GTWalsheimPro',
                                                    fontWeight: FontWeight.w400,
                                                    color: BestRateColorConstant
                                                        .darkTextBlack),),
                                            ),
                                            Text("${inquiriesAllProvider.rejectInquiriesModel?.rejectedInquiries?[index].businessName}",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'GTWalsheimPro',
                                                  fontWeight: FontWeight.w700,
                                                  color: BestRateColorConstant
                                                      .darkTextBlack),)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 20, 20, 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            const Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text("Quoted Price",
                                                style: TextStyle(fontSize: 14,
                                                    fontFamily: 'GTWalsheimPro',
                                                    fontWeight: FontWeight.w400,
                                                    color: BestRateColorConstant
                                                        .darkTextBlack),),
                                            ),
                                            Text("₹${inquiriesAllProvider.rejectInquiriesModel?.rejectedInquiries?[index].quotedPrice}",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'GTWalsheimPro',
                                                  fontWeight: FontWeight.w700,
                                                  color: BestRateColorConstant
                                                      .darkTextBlack),)
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            var permission = await FlDownloader
                                                .requestPermission();
                                            if (permission ==
                                                StoragePermissionStatus.granted) {
                                              await FlDownloader.download(
                                                  inquiriesAllProvider.rejectInquiriesModel?.rejectedInquiries?[index].quotationFiles ?? "");
                                              inquiriesAllProvider
                                                  .getDownload();
                                            }
                                          },
                                          child: Container(
                                            width: 120,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: BestRateColorConstant
                                                    .green,
                                                borderRadius: BorderRadius
                                                    .circular(10)
                                            ),
                                            child: inquiriesAllProvider
                                                .progress != 0
                                                ? const SizedBox(
                                                height: 5,
                                                width: 5,
                                                child: Center(
                                                    child: CircularProgressIndicator()))
                                                : Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                Image.asset(
                                                  'assets/images/download_image.png',
                                                  width: 24, height: 24,),
                                                const Text("Download",
                                                  style: TextStyle(fontSize: 14,
                                                      fontFamily: 'GTWalsheimPro',
                                                      fontWeight: FontWeight
                                                          .w700,
                                                      color: Colors.white),)
                                              ],
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.fromLTRB(20,20,20,0),
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //     children: [
                                  //       Container(
                                  //         width: 100,
                                  //         height: 40,
                                  //         decoration: BoxDecoration(
                                  //             color: BestRateColorConstant.darkTextBlack,
                                  //             borderRadius: BorderRadius.circular(10)
                                  //         ),
                                  //         child: Row(
                                  //           mainAxisAlignment: MainAxisAlignment.center,
                                  //           children: [
                                  //             Image.asset('assets/images/photo.png',width: 24,height: 24,),
                                  //             const Text("Photos",style: TextStyle(fontSize: 14,
                                  //                 fontFamily: 'GTWalsheimPro',
                                  //                 fontWeight: FontWeight.w700,
                                  //                 color: Colors.white),)
                                  //           ],
                                  //         ),
                                  //       ),
                                  //       Container(
                                  //         width: 100,
                                  //         height: 40,
                                  //         decoration: BoxDecoration(
                                  //             color: BestRateColorConstant.darkTextBlack,
                                  //             borderRadius: BorderRadius.circular(10)
                                  //         ),
                                  //         child: Row(
                                  //           mainAxisAlignment: MainAxisAlignment.center,
                                  //           children: [
                                  //             Image.asset('assets/images/stars.png',width: 24,height: 24,),
                                  //             const Text("Features",style: TextStyle(fontSize: 14,
                                  //                 fontFamily: 'GTWalsheimPro',
                                  //                 fontWeight: FontWeight.w700,
                                  //                 color: Colors.white),)
                                  //           ],
                                  //         ),
                                  //       ),
                                  //       Container(
                                  //         width: 110,
                                  //         height: 40,
                                  //         decoration: BoxDecoration(
                                  //             color: BestRateColorConstant.darkTextBlack,
                                  //             borderRadius: BorderRadius.circular(10)
                                  //         ),
                                  //         child: Row(
                                  //           mainAxisAlignment: MainAxisAlignment.center,
                                  //           children: [
                                  //             Image.asset('assets/images/call.png',width: 24,height: 24,),
                                  //             const Text("Contact",style: TextStyle(fontSize: 14,
                                  //                 fontFamily: 'GTWalsheimPro',
                                  //                 fontWeight: FontWeight.w700,
                                  //                 color: Colors.white),)
                                  //           ],
                                  //         ),
                                  //       )
                                  //
                                  //     ],
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.fromLTRB(0,20,0,0),
                                  //   child: Row(
                                  //
                                  //     children: [
                                  //       Container(
                                  //         width: 176,
                                  //         height: 55,
                                  //         decoration: const BoxDecoration(
                                  //             color: BestRateColorConstant.green,
                                  //             borderRadius: BorderRadius.only(
                                  //               bottomLeft: Radius.circular(20),
                                  //             )
                                  //         ),
                                  //         child: Row(
                                  //           mainAxisAlignment: MainAxisAlignment.center,
                                  //           children: [
                                  //             Image.asset('assets/images/check_circle.png',width: 24,height: 24,),
                                  //             const Padding(
                                  //               padding: EdgeInsets.only(left: 5.0),
                                  //               child: Text("Accept",style: TextStyle(fontSize: 16,
                                  //                   fontFamily: 'GTWalsheimPro',
                                  //                   fontWeight: FontWeight.w700,
                                  //                   color: Colors.white),),
                                  //             )
                                  //           ],
                                  //         ),
                                  //       ),
                                  //       Container(
                                  //         width: 176,
                                  //         height: 55,
                                  //         decoration: const BoxDecoration(
                                  //             color: BestRateColorConstant.darkRed,
                                  //             borderRadius: BorderRadius.only(
                                  //               bottomRight: Radius.circular(20),
                                  //             )
                                  //         ),
                                  //         child: Row(
                                  //           mainAxisAlignment: MainAxisAlignment.center,
                                  //           children: [
                                  //             Image.asset('assets/images/cancel.png',width: 24,height: 24,),
                                  //             const Padding(
                                  //               padding: EdgeInsets.only(left: 5.0),
                                  //               child: Text("Reject",style: TextStyle(fontSize: 16,
                                  //                   fontFamily: 'GTWalsheimPro',
                                  //                   fontWeight: FontWeight.w700,
                                  //                   color: Colors.white),),
                                  //             )
                                  //           ],
                                  //         ),
                                  //       )
                                  //     ],
                                  //   ),
                                  // )
                                ],
                              ),

                            ),
                          );
                        },

                      ) : const Center(
                        child: Text("No data found"),
                      )
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> getRejectInquiries(String token, int buyerId) async {
    final rejectInquiriesProvider = Provider.of<BuyerInquiriesProvider>(
        context, listen: false);
    await rejectInquiriesProvider.getBuyerRejectInquiries(token, buyerId);
  }
}

