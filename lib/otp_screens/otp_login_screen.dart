
import 'package:bestrateapp/constant/best_rate_color_constant.dart';
import 'package:bestrateapp/page_route/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../dashboard_screens/dashboard_screen.dart';
import '../providers/login_provider.dart';
import '../providers/resend_otp_provider.dart';
import '../sharedpreference/SharedPreferenceHelper.dart';
import '../sharedpreference/sharedpreference_constant.dart';
import '../utils/show_toast.dart';
class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _controllerMobile = TextEditingController();
  String? userMobile;
  String? userOtp;
  int? mobile;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      userMobile = await SharedPreferenceHelper.getData(SharedPreferenceConstant.USER_MOBILE);
      userOtp = await SharedPreferenceHelper.getData(SharedPreferenceConstant.USER_LOGIN_OTP);
      mobile = int.parse(userMobile!);
      setState(() {
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    return Consumer<ResendOtpProvider>(builder: (context,resendOtpProvider,_) {
        return Consumer<LoginProvider>(builder: (context,loginProvider,_) {
            return Stack(
              children: [
                Scaffold(
                  backgroundColor: Colors.white,
                  body: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  context.goNamed(MyApplicationRouteConstant.SIGNIN_SCREEN);
                                },
                                child: Padding(padding: EdgeInsets.all(10),
                                  child: Image.asset('assets/images/arrow_back_image.png'),
                                ),
                              ),
                              const Expanded(child: Center(
                                child: Padding(padding: EdgeInsets.all(10),
                                   child: Text("OTP Authentication", style: TextStyle(fontSize: 20,
                                       fontFamily: 'GTWalsheimPro',
                                       fontWeight: FontWeight.w700,
                                       color: BestRateColorConstant.darkBlack),),),
                                ),
                              )

                            ],
                          ),

                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30.0),
                          child: Column(
                            children: [
                              const Padding(padding: EdgeInsets.all(10),
                                  child: Text('An authentication code has been sent to',style: TextStyle(fontSize: 16,
                                      fontFamily: 'GTWalsheimPro',
                                      fontWeight: FontWeight.w400,
                                      color: BestRateColorConstant.darkBlack),)
                              ),
                              const Padding(padding: EdgeInsets.all(0),
                                  child: Text('+91 1234567890',style: TextStyle(fontSize: 16,
                                      fontFamily: 'GTWalsheimPro',
                                      fontWeight: FontWeight.w400,
                                      color: BestRateColorConstant.darkBlack),)
                              ),
                              Padding(padding: EdgeInsets.fromLTRB(50,40,50,0),
                               child: PinCodeTextField(
                                appContext: context,
                                controller: _controllerMobile,
                                length: 4,
                                cursorHeight: 19,
                                enableActiveFill: true,
                                keyboardType: TextInputType.number,
                                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  fieldWidth: 50,
                                  inactiveColor: Colors.grey,
                                  selectedColor: Color(0xFF01B576),
                                  activeFillColor: Colors.white,
                                  selectedFillColor: Colors.white,
                                  inactiveFillColor: Colors.white,
                                  borderWidth: 1,
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                onChanged: (String value) {
                                  print(value);
                                },

                              ),),
                              Padding(padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Don't received the code? ", style: TextStyle(fontSize: 16,
                                      fontFamily: 'GTWalsheimPro',
                                      fontWeight: FontWeight.w400,
                                      color: BestRateColorConstant.darkBlack),),
                                  GestureDetector(
                                    onTap: (){
                                      getResendOtpMobile(mobile!);
                                    },
                                    child: const Text("Resend", style: TextStyle(fontSize: 16, fontFamily: 'GTWalsheimPro',
                                        fontWeight: FontWeight.w700,
                                        color: BestRateColorConstant.darkBlack),),
                                  )
                                ],
                              ),),
                              Padding(padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints.tightFor(width: 350, height: 55),

                                  child: ElevatedButton(
                                    onPressed: (){
                                      if (_controllerMobile.text.isEmpty || _controllerMobile.text != userOtp){
                                        ShowToast.showToastError("Please enter valid OTP");
                                      }else{
                                        var otp = int.parse(_controllerMobile.text);
                                        getVerifyLoginOtp(userMobile.toString(), otp);
                                      }

                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF7258DB),
                                      foregroundColor: Colors.white,
                                      textStyle: TextStyle(fontSize: 16),
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),

                                    ),
                                    child: const Text("Submit", style: TextStyle(fontSize: 18,
                                        fontFamily: 'GTWalsheimPro',
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                  ),

                ),
                if (loginProvider.isLoading || resendOtpProvider.isLoading)
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
    );
  }

  Future<void> getVerifyLoginOtp(String mobileNo, int otp) async {
    final verifyLoginOtpProvider = Provider.of<LoginProvider>(context, listen: false);
    await verifyLoginOtpProvider.getVerifyLoginOtp(mobileNo, otp);
    if (verifyLoginOtpProvider.verifyOtpModel!.statusCode == 200 &&
        verifyLoginOtpProvider.verifyOtpModel!.status == true){
      SharedPreferenceHelper.saveLoginState(true);
      context.goNamed(MyApplicationRouteConstant.DASHBOARD_SCREEN);
    }

  }

  Future<void> getResendOtpMobile(int mobile) async{
    final resendOtpProvider = Provider.of<ResendOtpProvider>(context, listen: false);
    await resendOtpProvider.getResendOtpMobile(mobile);
  }
}

