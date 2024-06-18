import 'package:bestrateapp/constant/best_rate_color_constant.dart';
import 'package:bestrateapp/drawer/screen/view_inquiry_details.dart';
import 'package:bestrateapp/models/last_inquiries_model.dart';
import 'package:bestrateapp/page_route/route_constant.dart';
import 'package:bestrateapp/providers/buyer_inquiries_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../models/inquiries_model.dart';
import '../../sharedpreference/SharedPreferenceHelper.dart';
import '../../sharedpreference/sharedpreference_constant.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? buyerId;
  String? token;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // Show alert dialog after the first frame is displayed
      buyerId = await SharedPreferenceHelper.getData(SharedPreferenceConstant.BUYER_ID);
      token = await SharedPreferenceHelper.getData(SharedPreferenceConstant.USER_TOKEN);
      var user_id = int.parse(buyerId!);
      getInquiries(token!,user_id,"Home");
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Consumer<BuyerInquiriesProvider>(builder: (context,inquiriesProvider,_) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Column(
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
                                              child: const Text("Inquiries Generated", style: TextStyle(
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
                                                child:  Text((inquiriesProvider.buyerInquiriesModel?.totalInquiries ?? 0).toString(),
                                                  style: const TextStyle(
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
                                              child: const Text("Latest Bids", style: TextStyle(
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
                                                  child: Text((inquiriesProvider.buyerInquiriesModel?.latestBids ?? 0).toString(),
                                                    style: const TextStyle(
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
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("Last Inquiries", style: TextStyle(fontSize: 18,
                                fontFamily: 'GTWalsheimPro',
                                fontWeight: FontWeight.w700,
                                color: BestRateColorConstant.darkBlack ),),
                          ),
                        ),
                        Expanded(
                          child: inquiriesProvider.buyerInquiriesModel?.inquiries != null ? ListView.builder(
                              itemCount: inquiriesProvider.buyerInquiriesModel?.inquiries?.length,
                            itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: screenWidth,
                                decoration: BoxDecoration(
                                    color: BestRateColorConstant.green,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                       context.pushNamed(MyApplicationRouteConstant.INQUIRIES_DETAILS_SCREEN,
                                           extra: inquiriesProvider.buyerInquiriesModel?.inquiries?[index].inquiryid);                                 },
                                      child: Container(
                                        width: screenWidth * 0.89,
                                        decoration: const BoxDecoration(
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
                                                  Text("INQ ${inquiriesProvider.buyerInquiriesModel?.inquiries?[index].inquiryid.toString()}",
                                                    style: const TextStyle(fontSize: 14,
                                                      fontFamily: 'GTWalsheimPro',
                                                      fontWeight: FontWeight.w700,
                                                      color: BestRateColorConstant.darkBlack),),
                                                  Image.asset('assets/images/notification_icon.png')
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text("Product : ${inquiriesProvider.buyerInquiriesModel?.inquiries?[index].product}",
                                                  style: const TextStyle(fontSize: 14,
                                                      fontFamily: 'GTWalsheimPro',
                                                      fontWeight: FontWeight.w700,
                                                      color: BestRateColorConstant.darkBlack),),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text("Qty: ${inquiriesProvider.buyerInquiriesModel?.inquiries?[index].quantity}",
                                                  style: const TextStyle(fontSize: 14,
                                                    fontFamily: 'GTWalsheimPro',
                                                    fontWeight: FontWeight.w700,
                                                    color: BestRateColorConstant.darkBlack),),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text("${inquiriesProvider.buyerInquiriesModel?.inquiries?[index].inquiryDate} ,"
                                                    ""
                                                    " ${inquiriesProvider.buyerInquiriesModel?.inquiries?[index].inquiryTime}",
                                                  style: const TextStyle(fontSize: 12,
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
                                        child: SizedBox(
                                          width: 24,
                                            height: 24,
                                            child: Image.asset('assets/images/keyboard_arrow_right.png'))),
                                  ],
                                ),
                              ),
                            );
                          }) :
                          Container(
                              height: screenHeight,
                              child: const Center(
                                  child: Text("No data found"))),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              if (inquiriesProvider.isLoading)
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

  Future<void> getInquiries(String token, int buyerId, String page) async{
    final inquiriesProvider = Provider.of<BuyerInquiriesProvider>(context,listen: false);
    await inquiriesProvider.getBuyerInquiries(token, buyerId, page);
  }
}
