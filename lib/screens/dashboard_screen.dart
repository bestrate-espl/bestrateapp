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
  var drawerKey = GlobalKey<ScaffoldState>();
  var titleName = "My Profile";
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSection.myprofile){
      container = MyProfile();
      titleName = "My profile";
    }else if (currentPage == DrawerSection.aboutus){
      container = AboutUs();
      titleName = "About Us";
    }else if (currentPage == DrawerSection.termscondition){
      container = TermsConditions();
      titleName = "Terms & Conditions";
    }else if (currentPage == DrawerSection.privacypolicy){
      container = PrivacyPolicy();
      titleName = "Privacy Policy";
    }else if (currentPage == DrawerSection.signout){
      container = Container();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: drawerKey,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 25,
                        width: 25,
                        child: InkWell(
                          onTap: (){
                            drawerKey.currentState!.openDrawer();
                          },
                            child: Image.asset('assets/images/menu.png')),),
                    Expanded(
                        child: Center(
                            child: Text(titleName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18, color: Colors.black),)))
                  ],
                ),
                Expanded(child: container)
              ],
            ),
          ),
        ),
        drawer: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: IconThemeData(color: Colors.black)
          ), child: Drawer(
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
              _showAlert(context);
            }
          });
          drawerKey.currentState!.closeDrawer();
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
  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert Title'),
          content: Text('This is the alert message.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
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
