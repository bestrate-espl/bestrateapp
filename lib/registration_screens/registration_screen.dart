import 'package:bestrateapp/constant/best_rate_color_constant.dart';
import 'package:bestrateapp/controller/registration_controller.dart';
import 'package:bestrateapp/registration_screens/registration_helper_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  List<Widget> registrationScreens = [
    BuyerInformationScreen(),
    BusinessDetails()
  ];
  final registrationController = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<RegistrationController>(
        init: RegistrationController(),
          builder: (RegistrationController registrationController) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (registrationController.selectedPage > 0){
                        registrationController.updateRegistrationPage(registrationController.selectedPage - 1);
                      }else{
                       Navigator.pop(context);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Image.asset('assets/images/arrow_back_image.png'),
                    ),
                  ),
                  Expanded(
                    child: Padding(padding: EdgeInsets.fromLTRB(72, 10, 0, 0),
                      child: Text("Create an Account", style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'GTWalsheimPro',
                          fontWeight: FontWeight.w700,
                          color: BestRateColorConstant.darkBlack),),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: registrationScreens.map((e) =>
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      height: 4,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: registrationController.selectedPage == registrationScreens.indexOf(e)
                            ? BestRateColorConstant.appPrimaryColor
                            : BestRateColorConstant.appSecondaryColor,

                      ),
                    ),
                  )).toList(

              ),
            ),
            Expanded(child: registrationScreens[registrationController.selectedPage])
          ],
        );
      }),
    );
  }
}
