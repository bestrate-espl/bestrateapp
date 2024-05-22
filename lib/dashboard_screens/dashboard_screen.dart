import 'package:bestrateapp/constant/best_rate_color_constant.dart';
import 'package:bestrateapp/drawer/screen/about_us.dart';
import 'package:bestrateapp/drawer/screen/create_inquiry.dart';
import 'package:bestrateapp/drawer/screen/home.dart';
import 'package:bestrateapp/drawer/screen/my_inquiry.dart';
import 'package:bestrateapp/drawer/screen/my_profile.dart';
import 'package:bestrateapp/drawer/screen/privacy_policy.dart';
import 'package:bestrateapp/drawer/screen/terms_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../drawer/my_header_drawer.dart';
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var container;
  var currentPage  = DrawerSection.home;
  var drawerKey = GlobalKey<ScaffoldState>();
  var titleName = "Home";
  int myIndex = 0;
  int selectedIndex = 0;
  bool isSideMenu = false;
  List<Map<String, String>> pagesName = <Map<String, String>>[
    {'image': 'assets/images/home.png', 'name': 'Home', 'selectedImage': 'assets/images/home.png'},
    {'image': 'assets/images/contract_edit.png', 'name': 'Create Inquiry', 'selectedImage': 'assets/images/contract_edit.png'},
    {'image': 'assets/images/list_alt.png', 'name': 'My Inquiries', 'selectedImage': 'assets/images/list_alt.png'}
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        key: drawerKey,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(22),
                child: Row(
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
                            child: Text(titleName,style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'GTWalsheimPro',
                                fontWeight: FontWeight.w700,
                                color: BestRateColorConstant.darkBlack),)))
                  ],
                ),
              ),
              Expanded(
                  child: container ?? Home()),
            ],
          ),
        ),
        /*Side Navigation Bar*/
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
        /*Bottom Navigation Bar*/
       bottomNavigationBar: Container(
         decoration: BoxDecoration(
           boxShadow: [
             BoxShadow(
               offset: const Offset(0, 3),
               spreadRadius: 0.2,
               blurRadius: 5,
             ),
           ]
         ),
         width: MediaQuery.of(context).size.width,
         height: 60,
         child: Row(
           children: List.generate(
             pagesName.length,
                 (index) => myBottomItem(index),
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
  void updateDrawerPage(var currentPage){
    if (currentPage == DrawerSection.home){
      container = Home();
      titleName = "Home";
    }else if (currentPage == DrawerSection.myprofile){
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
    setState(() {

    });
  }
  void updateIndex(int index){
    selectedIndex = index;
    isSideMenu = false;
    if (selectedIndex == 0){
      container = Home();
      titleName = "Home";
    }else if ( selectedIndex == 1){
      container = CreateInquiry();
      titleName = "Create Inquiry";
    }else if (selectedIndex == 2){
      container = MyInquiry();
      titleName = "My Inquiries";
    }
    setState(() {
    });
  }
  Widget myBottomItem(int index){
    bool isSelected = selectedIndex == index && !isSideMenu;
    return GestureDetector(
      onTap: () async {
       updateIndex(index);
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 3,
        decoration:  BoxDecoration(color: isSelected ? BestRateColorConstant.appPrimaryColor : Colors.white),
        child: Padding(
          padding: EdgeInsets.only(left: 18.0, right: 18.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Column(
                children: [
                  Image.asset(pagesName[index]['selectedImage'] ?? "",height: isSelected ? 24 : 24,
                    color: isSelected ? Colors.white : BestRateColorConstant.darkBlack,),
                  // PlumImageAsset(
                  //   image: isSelected
                  //       ? indexPageController.pagesName[index]['selectedImage']
                  //       : indexPageController.pagesName[index]['image'],
                  //   color: isSelected ? PlumColorConstant.appPrimaryColor : PlumColorConstant.lightGreyColor,
                  //   height: isSelected ? 22.px : 20.px,
                  //   isRepeat: true,
                  // ),
                  SizedBox(height: 6),
                  Text(pagesName[index]['name'] ?? "",style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'GTWalsheimPro',
                    fontWeight: isSelected ? FontWeight.w500 : FontWeight.w500,color: isSelected ? Colors.white : BestRateColorConstant.darkBlack,))
                  // PlumText(
                  //   indexPageController.pagesName[index]['name']!,
                  //   color: isSelected ? PlumColorConstant.appPrimaryColor : PlumColorConstant.lightGreyColor,
                  //   fontSize: 11.px,
                  //   maxLines: 1,
                  //   fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget menuItems(int id, String title, String image, bool selected){
    return Material(
      // color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: (){
          isSideMenu = true;
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
          updateDrawerPage(currentPage);
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
                        fontSize: 18,
                        fontFamily: 'GTWalsheimPro',
                        fontWeight: FontWeight.w400,
                        color: BestRateColorConstant.darkBlack),))
            ],
          ),
        ),
      ),
    );
  }
  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialogWidget()
    );
  }
}
enum DrawerSection{
  home,
  myprofile,
  aboutus,
  termscondition,
  privacypolicy,
  signout
}


class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text("Are you sure you want to logout?", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,color: Colors.black),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                width: 350,
                height: 1,
                color: BestRateColorConstant.appSecondaryColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 70),
                  child: Text("No", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      width: 1,
                      height: 50,
                      color: BestRateColorConstant.appSecondaryColor,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Text("Yes, sure", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

