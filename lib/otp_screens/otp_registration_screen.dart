import 'package:bestrateapp/constant/best_rate_color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import '../models/register_model.dart';
import '../page_route/route_constant.dart';
import '../providers/resend_otp_provider.dart';
import '../providers/verify_register_otp_provider.dart';
import '../sharedpreference/SharedPreferenceHelper.dart';
import '../utils/show_toast.dart';
class OtpRegistrationScreen extends StatefulWidget {
  final String  mobileNo,mobileOtp, emailId, emailOtp;
  final int userId;
  const OtpRegistrationScreen({super.key, required this.userId, required this.mobileNo,
    required this.mobileOtp, required this.emailId, required this.emailOtp});

  @override
  State<OtpRegistrationScreen> createState() => _OtpRegistrationScreenState();
}

class _OtpRegistrationScreenState extends State<OtpRegistrationScreen> {
  final TextEditingController _controllerMobile = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Consumer<ResendOtpProvider>(builder: (context,resendOtpProvider,_) {
        return Consumer<VerifyRegisterOtpProvider>(builder: (context,verifyOtpProvider,_) {
            return Stack(
              children: [
                Scaffold(
                  backgroundColor: Colors.white,
                  body: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                context.goNamed(MyApplicationRouteConstant.REGISTRATION_SCREEN);
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
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: BestRateColorConstant.lightGray,
                                    borderRadius: BorderRadius.circular(10.0),),
                                  height: 270.0,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        const Padding(padding: EdgeInsets.only(top: 20),
                                            child: Text('Mobile Number Verification',style: TextStyle(fontSize: 16,
                                                fontFamily: 'GTWalsheimPro',
                                                fontWeight: FontWeight.w700,
                                                color: BestRateColorConstant.darkBlack),)
                                        ),
                                        const Padding(padding: EdgeInsets.only(top: 20),
                                            child: Text('An authentication code has been sent to',style: TextStyle(fontSize: 16,
                                                fontFamily: 'GTWalsheimPro',
                                                fontWeight: FontWeight.w400,
                                                color: BestRateColorConstant.darkBlack),)
                                        ),
                                        Padding(padding: EdgeInsets.only(top: 2),
                                            child: Text("+91 ${widget.mobileNo}",style: const TextStyle(fontSize: 16,
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
                                                  var mobile_no = int.parse(widget.mobileNo);
                                                  getResendOtpMobile(mobile_no);
                                                },
                                                child: const Text("Resend", style: TextStyle(fontSize: 16, fontFamily: 'GTWalsheimPro',
                                                    fontWeight: FontWeight.w700,
                                                    color: BestRateColorConstant.darkBlack),),
                                              )
                                            ],
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: BestRateColorConstant.lightGray,
                                    borderRadius: BorderRadius.circular(10.0),),
                                  height: 270.0,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        const Padding(padding: EdgeInsets.only(top: 20),
                                            child: Text('Email Address Verification',style: TextStyle(
                                                fontSize: 16,  fontFamily: 'GTWalsheimPro',
                                                fontWeight: FontWeight.w700,
                                                color: BestRateColorConstant.darkBlack),)
                                        ),
                                        const Padding(padding: EdgeInsets.only(top: 20),
                                            child: Text('An authentication code has been sent to',style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'GTWalsheimPro',
                                                fontWeight: FontWeight.w400,
                                                color: BestRateColorConstant.darkBlack),)
                                        ),
                                        Padding(padding: EdgeInsets.only(top: 2),
                                            child: Text(widget.emailId,style: const TextStyle(fontSize: 16,
                                                fontFamily: 'GTWalsheimPro',
                                                fontWeight: FontWeight.w400,
                                                color: BestRateColorConstant.darkBlack),)
                                        ),
                                        Padding(padding: EdgeInsets.fromLTRB(50,40,50,0),
                                          child: PinCodeTextField(
                                            appContext: context,
                                            controller: _controllerEmail,
                                            length: 4,
                                            cursorHeight: 19,
                                            enableActiveFill: true,
                                            keyboardType: TextInputType.number,
                                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                                                  getResendOtpEmail(widget.emailId);
                                                },
                                                child: const Text("Resend", style: TextStyle(fontSize: 16, fontFamily: 'GTWalsheimPro',
                                                    fontWeight: FontWeight.w700,
                                                    color: BestRateColorConstant.darkBlack),),
                                              )
                                            ],
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints.tightFor(width: 350, height: 55),

                                  child: ElevatedButton(
                                    onPressed: (){
                                      if (_controllerMobile.text.isEmpty ||_controllerMobile.text != widget.mobileOtp){
                                        ShowToast.showToastError("Please enter valid mobile otp");
                                      }else if (_controllerEmail.text.isEmpty ||_controllerEmail.text != widget.emailOtp){
                                        ShowToast.showToastError("Please enter valid email otp");
                                      }else{
                                        var mobileOtp = int.parse(_controllerMobile.text);
                                        var emailOtp = int.parse(_controllerEmail.text);
                                        getVerifyRegisterOtp(widget.userId.toString(),mobileOtp,emailOtp);
                                      }
                                      // Navigator.push(context, MaterialPageRoute(builder: (context){
                                      //   return DashboardScreen();
                                      // }));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: BestRateColorConstant.appPrimaryColor,
                                      foregroundColor: Colors.white,
                                      textStyle: TextStyle(fontSize: 16),
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),

                                    ),
                                    child: const Text("Submit", style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'GTWalsheimPro',
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white
                                    ),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )

                    ],
                  ),
                ),
                if (verifyOtpProvider.isLoading || resendOtpProvider.isLoading)
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

  Future<void> getVerifyRegisterOtp(String userId, int mobileOtp, int emailOtp) async {
    final verifyRegisterOtpProvider = Provider.of<VerifyRegisterOtpProvider>(context, listen: false);
    await verifyRegisterOtpProvider.getVerifyRegisterOtp(userId, mobileOtp, emailOtp);
    if (verifyRegisterOtpProvider.verifyOtpModel!.statusCode == 200 &&
        verifyRegisterOtpProvider.verifyOtpModel!.status == true){
      SharedPreferenceHelper.saveLoginState(true);
      context.goNamed(MyApplicationRouteConstant.DASHBOARD_SCREEN);
    }
  }

  Future<void> getResendOtpMobile(int mobile) async{
    final resendOtpProvider = Provider.of<ResendOtpProvider>(context, listen: false);
    await resendOtpProvider.getResendOtpMobile(mobile);
  }

  Future<void> getResendOtpEmail(String email) async{
    final resendOtpProvider = Provider.of<ResendOtpProvider>(context, listen: false);
    await resendOtpProvider.getResendOtpEmail(email);
  }
}
