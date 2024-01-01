import 'package:bestrateapp/constant/best_rate_color_constant.dart';
import 'package:flutter/material.dart';
class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: BestRateColorConstant.appPrimaryColor,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/user_icon.png')
              )
            ),
          ),
          Text("Sumit Ranjan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),),
          Text("sumit@gmail.com", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18, color: Colors.white),),
        ],
      ),
    );
  }
}
