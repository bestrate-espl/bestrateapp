import 'package:bestrateapp/constant/best_rate_color_constant.dart';
import 'package:bestrateapp/drawer/screen/about_us.dart';
import 'package:bestrateapp/drawer/screen/my_profile.dart';
import 'package:bestrateapp/drawer/screen/privacy_policy.dart';
import 'package:bestrateapp/drawer/screen/terms_conditions.dart';
import 'package:flutter/material.dart';

import '../drawer/my_header_drawer.dart';
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var currentPage  = DrawerSection.myprofile;
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSection.myprofile){
      container = MyProfile();
    }else if (currentPage == DrawerSection.aboutus){
      container = AboutUs();
    }else if (currentPage == DrawerSection.aboutus){
      container = TermsConditions();
    }else if (currentPage == DrawerSection.aboutus){
      container = PrivacyPolicy();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Home"),
        backgroundColor: BestRateColorConstant.appPrimaryColor,),
        body: container,
        drawer: Drawer(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList()
              ],
            ),
          ),
        ),
      ),

    );
  }
  Widget MyDrawerList(){
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItems(1,"My Profile", 'assets/images/assignment_ind.png',currentPage == DrawerSection.myprofile ? true : false),
          menuItems(2,"About Us", 'assets/images/info.png',currentPage == DrawerSection.myprofile ? true : false),
          menuItems(3,"Terms & Conditions", 'assets/images/gavel.png',currentPage == DrawerSection.myprofile ? true : false),
          menuItems(4,"Privacy Policy", 'assets/images/local_police.png',currentPage == DrawerSection.myprofile ? true : false),
          menuItems(5,"Sign Out", 'assets/images/logout.png',currentPage == DrawerSection.myprofile ? true : false),
        ],
      ),
    );
  }

  Widget menuItems(int id, String title, String image, bool selected){
    return Material(
      // color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: (){
          Navigator.pop(context);
          setState(() {
            if (id == 1){
              currentPage = DrawerSection.myprofile;
            } else if (id == 2){
              currentPage = DrawerSection.aboutus;
            }else if (id == 3){
              currentPage = DrawerSection.termscondition;
            }else if (id == 4){
              currentPage = DrawerSection.privacypolicy;
            }else if (id == 5){
              currentPage = DrawerSection.signout;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(child: Image.asset(image),),
              Expanded(
                flex: 5,
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),))
            ],
          ),
        ),
      ),
    );
  }
}
enum DrawerSection{
  myprofile,
  aboutus,
  termscondition,
  privacypolicy,
  signout
}
