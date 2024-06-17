import 'package:bestrateapp/constant/best_rate_color_constant.dart';
import 'package:bestrateapp/sharedpreference/SharedPreferenceHelper.dart';
import 'package:bestrateapp/sharedpreference/sharedpreference_constant.dart';
import 'package:flutter/material.dart';
class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  String? userName;
  String? userEmail;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      userName = await SharedPreferenceHelper.getData(SharedPreferenceConstant.USER_NAME);
      userEmail = await SharedPreferenceHelper.getData(SharedPreferenceConstant.USER_EMAIL);
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: BestRateColorConstant.appPrimaryColor,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/user_icon.png')

              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userName ?? "", style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'GTWalsheimPro',
                      fontWeight: FontWeight.w700,
                      color: Colors.white),),
                  Text(userEmail ?? "", style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'GTWalsheimPro',
                      fontWeight: FontWeight.w400,
                      color: Colors.white),),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
