import 'package:bestrateapp/constant/best_rate_color_constant.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 180,
                          height: 90,
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
                          height: 90,
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
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
