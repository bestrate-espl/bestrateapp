import 'package:bestrateapp/otp_screens/otp_login_screen.dart';
import 'package:bestrateapp/page_route/route_constant.dart';
import 'package:bestrateapp/registration_screens/registration_screen.dart';
import 'package:bestrateapp/utils/Validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../constant/best_rate_color_constant.dart';
import '../providers/login_provider.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _mobileTextController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _mobileTextController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    return Consumer<LoginProvider>(builder: (context,loginProvider,_) {
        return Stack(
          children: [
            Form(
              key: _formKey,
              child: Scaffold(
                // resizeToAvoidBottomInset: true,
                body: PopScope(
                  canPop: false,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  child: Image.asset('assets/images/best_rate_app_logo.png')
                              ),
                              Container(
                                child: const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Text('Best Rate',style: TextStyle(fontSize: 32,
                                      color: BestRateColorConstant.darkBlack,
                                      fontFamily: 'GTWalsheimPro',
                                      fontWeight: FontWeight.w700,),)
                                ),
                              ),
                              Container(
                                child: const Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                                    child: Text('Welcome!',style: TextStyle(fontSize: 22,
                                      color: BestRateColorConstant.darkBlack,
                                      fontFamily: 'GTWalsheimPro',
                                      fontWeight: FontWeight.w700,),)
                                ),
                              ),
                              Container(
                                child: const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Text('Enter your phone no to continue',style: TextStyle(fontSize: 16,
                                        fontFamily: 'GTWalsheimPro',
                                        fontWeight: FontWeight.w400,
                                        color: BestRateColorConstant.appSecondaryColor),)
                                ),
                              ),
                              Padding(padding: EdgeInsets.fromLTRB(40, 16, 40, 0),
                                  child: TextFormField(
                                    controller: _mobileTextController,
                                    maxLines: 1,
                                    maxLength: 15,
                                    keyboardType: TextInputType.text,
                                    validator: Validators.validateGSTIN,
                                    onChanged: (value){

                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Enter',
                                      contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                      hintStyle: const TextStyle(
                                          fontFamily: 'GTWalsheimPro',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),

                                    ),
                                  ),
                              ),
                              Padding(padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints.tightFor(width: 350, height: 55),

                                  child: ElevatedButton(
                                    onPressed: (){
                                      if (_formKey.currentState!.validate()){
                                        getLogin(_mobileTextController.text);
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      foregroundColor: Colors.white,
                                      textStyle: const TextStyle(fontSize: 18),
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),

                                    ),
                                    child: const Text("Send OTP", style: TextStyle(fontSize: 16,
                                      fontFamily: 'GTWalsheimPro',
                                      fontWeight: FontWeight.w700,
                                    color: Colors.white),),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Column(
                                      children : [
                                        const Padding(padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                                            child: Text("Don't have an account?",style: TextStyle(fontSize: 16,
                                                color: BestRateColorConstant.darkBlack,
                                              fontFamily: 'GTWalsheimPro',
                                              fontWeight: FontWeight.w400,),)

                                        ),
                                        Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints.tightFor(width: 350, height: 55),

                                            child: ElevatedButton(
                                              onPressed: (){
                                                context.goNamed(MyApplicationRouteConstant.REGISTRATION_SCREEN);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: BestRateColorConstant.appPrimaryColor,
                                                foregroundColor: Colors.white,
                                                textStyle: const TextStyle(fontSize: 16,
                                                    fontFamily: 'GTWalsheimPro',
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white),
                                                elevation: 8,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10)
                                                ),

                                              ),
                                              child: const Text("Sign Up"),
                                            ),
                                          ),
                                        ),
                                      ]

                                  )


                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

              ),
            ),
            if (loginProvider.isLoading)
              Container(
                // width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        );
      }
    );
  }
  Future<void> getLogin(String mobileNo) async{
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    await loginProvider.getLogin(mobileNo);
    if (loginProvider.loginModel!.statusCode == 200 && loginProvider.loginModel!.status == true){
      context.goNamed(MyApplicationRouteConstant.OTP_SIGNIN_SCREEN);
    }
  }
  Future<bool> _onBackPressed(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to exit the app?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Yes'),
          ),
        ],
      ),
    ).then((value) => value ?? false);
  }
}
