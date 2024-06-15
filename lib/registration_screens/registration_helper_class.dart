import 'package:bestrateapp/models/area_model.dart';
import 'package:bestrateapp/otp_screens/otp_registration_screen.dart';
import 'package:bestrateapp/page_route/route_constant.dart';
import 'package:bestrateapp/providers/registration_area_provider%20.dart';
import 'package:bestrateapp/providers/registration_provider.dart';
import 'package:bestrateapp/request_models/register_request_model.dart';
import 'package:bestrateapp/utils/Validators.dart';
import 'package:bestrateapp/utils/show_toast.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../constant/best_rate_color_constant.dart';
import '../controller/registration_controller.dart';

class BuyerInformationScreen extends StatefulWidget {
  const BuyerInformationScreen({super.key});

  @override
  State<BuyerInformationScreen> createState() => _BuyerInformationScreenState();
}

class _BuyerInformationScreenState extends State<BuyerInformationScreen> {
  final registrationController = Get.find<RegistrationController>();
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _pinController = TextEditingController();

  final textEditingController = TextEditingController();

  AreaData? _selectedValue;



  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _pinController.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getArea();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RegistrationProvider>(builder: (context,registerProvider,_) {
        return Consumer<RegistrationAreaProvider>(builder: (context,areaProvider,_) {
            return Stack(
              children: [
                Scaffold(
                  backgroundColor: Colors.white,
                  body: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Text("1. Buyer Information Details", style: TextStyle(fontSize: 18,
                                fontFamily: 'GTWalsheimPro',
                                fontWeight: FontWeight.w700,
                                color: BestRateColorConstant.darkBlack),),
                          ),
                        ),
                        Expanded(child:  SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(20,30,20,0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                          width: 170,
                                          child: Text("First Name", style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'GTWalsheimPro',
                                              fontWeight: FontWeight.w500,
                                              color: BestRateColorConstant.darkBlack),)),
                                      SizedBox(
                                          width: 170,
                                          child: Text("Last Name", style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'GTWalsheimPro',
                                              fontWeight: FontWeight.w500,
                                              color: BestRateColorConstant.darkBlack)))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20,10,20,0),
                                  child:   Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: _firstNameController,
                                          maxLines: 1,
                                          validator: Validators.validateFirstName,
                                          keyboardType: TextInputType.text,
                                          onChanged: (value){
                                            registerProvider.requestModel.firstName = value;
                                          },
                                          decoration: InputDecoration(
                                            hintText: 'Enter',
                                            contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                            hintStyle: const TextStyle(color: Colors.grey),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),

                                          ),

                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: TextFormField(
                                          controller: _lastNameController,
                                          keyboardType: TextInputType.text,
                                          maxLines: 1,
                                          validator: Validators.validateLastName,
                                          onChanged: (value){
                                            registerProvider.requestModel.lastName = value;
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
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20,20,20,0),
                                  child: Container(
                                      child: const Text("Email Address*", style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'GTWalsheimPro',
                                          fontWeight: FontWeight.w500,
                                          color: BestRateColorConstant.darkBlack),)),
                                ),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20,10,20,0),
                                  child: TextFormField(
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    maxLines: 1,
                                    validator: Validators.validateEmail,
                                    onChanged: (value){
                                      registerProvider.requestModel.email = value;
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

                                const Padding(
                                  padding: EdgeInsets.fromLTRB(20,20,20,0),
                                  child: Text("Mobile Number*", style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'GTWalsheimPro',
                                      fontWeight: FontWeight.w500,
                                      color: BestRateColorConstant.darkBlack),),
                                ),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20,10,20,0),
                                  child:TextFormField(
                                    controller: _mobileController,
                                    maxLength: 10,
                                    maxLines: 1,
                                    keyboardType: TextInputType.number,
                                    validator: Validators.validatePhone,
                                    onChanged: (value){
                                      var no = int.parse(value);
                                      registerProvider.requestModel.mobileNumber = no;
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

                                const Padding(
                                  padding: EdgeInsets.fromLTRB(20,10,20,0),
                                  child: Text("Area*", style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'GTWalsheimPro',
                                      fontWeight: FontWeight.w500,
                                      color: BestRateColorConstant.darkBlack),),
                                ),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20,10,20,0),
                                  child:  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    height: 48,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: Colors.grey, // Border color
                                        width: 1.0, // Border width
                                      ),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2<AreaData>(
                                        isExpanded: true,
                                        hint: const Text(
                                          'Select Area',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                            fontFamily: 'GTWalsheimPro',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        items: areaProvider.areaData?.data!
                                            .map((AreaData areaData) => DropdownMenuItem<AreaData>(
                                          value: areaData,
                                          child: Text(
                                            areaData.location.toString(),
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        )).toList(),
                                        value: _selectedValue,
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedValue = value;
                                          });
                                          registerProvider.requestModel.area = _selectedValue?.location;
                                        },
                                        buttonStyleData: const ButtonStyleData(
                                          padding: EdgeInsets.symmetric(horizontal: 16),
                                          height: 40,
                                          width: 200,
                                        ),
                                        dropdownStyleData: const DropdownStyleData(
                                          maxHeight: 200,
                                        ),
                                        menuItemStyleData: const MenuItemStyleData(
                                          height: 40,
                                        ),
                                        dropdownSearchData: DropdownSearchData(
                                          searchController: textEditingController,
                                          searchInnerWidgetHeight: 50,
                                          searchInnerWidget: Container(
                                            height: 50,
                                            padding: const EdgeInsets.only(
                                              top: 8,
                                              bottom: 4,
                                              right: 8,
                                              left: 8,
                                            ),
                                            child: TextFormField(
                                              expands: true,
                                              maxLines: null,
                                              controller: textEditingController,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                contentPadding: const EdgeInsets.symmetric(
                                                  horizontal: 10.0,
                                                  vertical: 5,
                                                ),
                                                hintText: 'Search for an item...',
                                                hintStyle: const TextStyle(fontSize: 12,
                                                  fontFamily: 'GTWalsheimPro',
                                                  fontWeight: FontWeight.w500,),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                              ),
                                            ),
                                          ),
                                          searchMatchFn: (item, searchValue) {
                                            return item.value.toString().contains(searchValue);
                                          },
                                        ),
                                        //This to clear the search value when you close the menu
                                        onMenuStateChange: (isOpen) {
                                          if (!isOpen) {
                                            textEditingController.clear();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20,30,20,0),
                                  child: Row(
                                    children: [
                                      Container(
                                          child: const Text("Pin Code*", style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'GTWalsheimPro',
                                              fontWeight: FontWeight.w500,
                                              color: BestRateColorConstant.darkBlack),)),
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20,10,20,0),
                                  child: TextFormField(
                                    controller: _pinController,
                                    maxLength: 6,
                                    maxLines: 1,
                                    keyboardType: TextInputType.number,
                                    validator: Validators.validatePin,
                                    onChanged: (value){
                                      var no = int.parse(value);
                                      registerProvider.requestModel.pincode = no;
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
                                  )
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20,30,20,20),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints.tightFor(width: 370, height: 55),

                                    child: ElevatedButton(
                                      onPressed: () {
                                        if(_formKey.currentState!.validate()) {
                                          if (_selectedValue == null) {
                                            ShowToast.showToastError("Please select area");
                                          } else {
                                            registrationController.updateRegistrationPage(1);
                                          }
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF7258DB),
                                        foregroundColor: Colors.white,
                                        textStyle: TextStyle(fontSize: 18),
                                        elevation: 8,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10)
                                        ),

                                      ),
                                      child: const Text("Next", style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'GTWalsheimPro',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white
                                      ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),)

                      ],
                    ),
                  ),
                ),
                if (areaProvider.isLoading)
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
  Future<void> getArea() async {
    final areaProvider = Provider.of<RegistrationAreaProvider>(context,listen: false);
    await areaProvider.getArea();
  }
}


class BusinessDetails extends StatefulWidget {
  const BusinessDetails({super.key});

  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  final _formKey = GlobalKey<FormState>();
  final registrationController = Get.find<RegistrationController>();
  final _businessNameController = TextEditingController();
  final _gstinController = TextEditingController();


  String selectedValue = 'Option 1';
  bool isChecked = false;

  @override
  void dispose() {
    _businessNameController.dispose();
    _gstinController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<RegistrationProvider>(builder: (context,registerProvider,_) {
        return Stack(
          children: [
            Form(
              key: _formKey,
              child: Scaffold(
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Text(
                              "2. Business Details", style: TextStyle(fontSize: 18,
                                fontFamily: 'GTWalsheimPro',
                                fontWeight: FontWeight.w700,
                                color: BestRateColorConstant.darkBlack),),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(30, 30, 20, 0),
                                child: Row(
                                  children: [
                                    Container(
                                        child: const Text(
                                          "Are you a Business?", style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'GTWalsheimPro',
                                            fontWeight: FontWeight.w500,
                                            color: BestRateColorConstant.darkBlack),)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Container(
                                  child: Row(
                                    children: [
                                      // Radio button for Option 1
                                      Radio(
                                        value: 'Yes',
                                        groupValue: selectedValue,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedValue = value!;
                                          });
                                        },
                                        activeColor: Colors.black,
                                      ),
                                      const Text('Yes', style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'GTWalsheimPro',
                                          fontWeight: FontWeight.w500,
                                          color: BestRateColorConstant.darkBlack),),

                                      // Radio button for Option 2
                                      Radio(
                                        value: 'No',
                                        groupValue: selectedValue,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedValue = value!;
                                          });
                                          registerProvider.requestModel.entity = selectedValue;
                                        },
                                        activeColor: Colors.black,
                                      ),
                                      const Text('No', style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'GTWalsheimPro',
                                          fontWeight: FontWeight.w500,
                                          color: BestRateColorConstant.darkBlack),),

                                      // Display the selected value
                                      // SizedBox(width: 20.0),
                                      // Text('Selected Value: $selectedValue'),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                                child: Row(
                                  children: [
                                    Container(
                                        child: const Text("Business Name", style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'GTWalsheimPro',
                                            fontWeight: FontWeight.w500,
                                            color: BestRateColorConstant.darkBlack),)),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                                child: TextFormField(
                                  controller: _businessNameController,
                                  maxLines: 1,
                                  keyboardType: TextInputType.text,
                                  validator: Validators.validateBusinessName,
                                  onChanged: (value){
                                    registerProvider.requestModel.businessName = value;
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

                              const Padding(
                                padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                                child: Row(
                                  children: [
                                    Text("GSTIN", style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'GTWalsheimPro',
                                        fontWeight: FontWeight.w500,
                                        color: BestRateColorConstant.darkBlack),),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                                child: TextFormField(
                                  controller: _gstinController,
                                  maxLines: 1,
                                  maxLength: 15,
                                  keyboardType: TextInputType.text,
                                  validator: Validators.validateGSTIN,
                                  onChanged: (value){
                                    registerProvider.requestModel.gst = value;
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
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    // Checkbox
                                    Checkbox(
                                      value: isChecked,
                                      onChanged: (value) {
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      },
                                      activeColor: Colors.black,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          const TextSpan(
                                            text: 'I agree to the ',
                                            style: TextStyle(fontSize: 14,
                                                fontFamily: 'GTWalsheimPro',
                                                fontWeight: FontWeight.w400,
                                                color: BestRateColorConstant.darkBlack),
                                          ),
                                          TextSpan(
                                            text: 'Terms of Use',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'GTWalsheimPro',
                                              fontWeight: FontWeight.w400,
                                              color: BestRateColorConstant
                                                  .appPrimaryColor,
                                              decoration: TextDecoration.underline,
                                            ),
                                            // Add a gesture recognizer for the privacy policy link
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                // Handle tap on privacy policy link
                                                print('Terms of Use tapped!');
                                                // Add your navigation logic here if you want to navigate to the privacy policy page
                                              },
                                          ),
                                          const TextSpan(
                                            text: ' and ',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'GTWalsheimPro',
                                                fontWeight: FontWeight.w400,
                                                color: BestRateColorConstant.darkBlack
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Privacy Policy',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'GTWalsheimPro',
                                              fontWeight: FontWeight.w400,
                                              color: BestRateColorConstant
                                                  .appPrimaryColor,
                                              decoration: TextDecoration.underline,
                                            ),
                                            // Add a gesture recognizer for the terms of service link
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                // Handle tap on terms of service link
                                                print('Privacy Policy tapped!');
                                                // Add your navigation logic here if you want to navigate to the terms of service page
                                              },
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Display the checkbox state
                                    // SizedBox(height: 20.0),
                                    // Text('Checkbox State: $isChecked'),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints.tightFor(width: 370,
                                      height: 55),

                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()){
                                        if (selectedValue == "Option 1"){
                                          ShowToast.showToastError("Please select Business");
                                        }else if (isChecked == false){
                                          ShowToast.showToastError("Please check Terms & Privacy Policy");
                                        }else{
                                          registerProvider.requestModel.role = 2;
                                          getRegister();
                                        }
                                      }


                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF7258DB),
                                      foregroundColor: Colors.white,
                                      textStyle: TextStyle(fontSize: 18),
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),

                                    ),
                                    child: const Text("Sign Up",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'GTWalsheimPro',
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (registerProvider.isLoading)
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
  Future<void> getRegister() async {
    final _registerProvider = Provider.of<RegistrationProvider>(context, listen: false);
    await _registerProvider.getRegister();
    if (_registerProvider.registerModel!.statusCode == 200 && _registerProvider.registerModel!.status == true){
      context.goNamed(MyApplicationRouteConstant.OTP_REGISTRATION_SCREEN, extra: _registerProvider.registerModel);
    }
  }
}
