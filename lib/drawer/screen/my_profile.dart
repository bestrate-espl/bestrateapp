import 'package:bestrateapp/providers/profile_provider.dart';
import 'package:bestrateapp/providers/registration_area_provider%20.dart';
import 'package:bestrateapp/request_models/request_update_profile_model.dart';
import 'package:bestrateapp/utils/internet_controller.dart';
import 'package:bestrateapp/utils/show_toast.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../constant/best_rate_color_constant.dart';
import '../../models/area_model.dart';
import '../../sharedpreference/SharedPreferenceHelper.dart';
import '../../sharedpreference/sharedpreference_constant.dart';
import '../../utils/Validators.dart';
class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final _formKey = GlobalKey<FormState>();
  String? token,buyerId,userId,userArea;
  String selectedValue = 'Option 1';
  bool isChecked = false;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _pinController = TextEditingController();
  final _businessNameController = TextEditingController();
  final _gstinController = TextEditingController();

  final textEditingController = TextEditingController();
  RequestUpdateProfileModel requestUpdateProfileModel = RequestUpdateProfileModel();
  AreaData? _selectedValue;



  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _pinController.dispose();
    _businessNameController.dispose();
    _gstinController.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      token = await SharedPreferenceHelper.getData(SharedPreferenceConstant.USER_TOKEN);
      buyerId = await SharedPreferenceHelper.getData(SharedPreferenceConstant.PROFILE_ID);
      userId = await SharedPreferenceHelper.getData(SharedPreferenceConstant.USER_ID);
      getArea();
      var buyer_id = int.parse(buyerId!);
      getProfile(token!, buyer_id);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InternetController>(
      builder: (tx) {
        return Consumer<ProfileProvider>(builder: (context,profileProvider,_) {
            return Consumer<RegistrationAreaProvider>(builder: (context,areaProvider,_) {
                return Scaffold(
                  backgroundColor: Colors.white,
                  body: tx.isConnectedToInternet ? Stack(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Expanded(child:  SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(20,30,20,0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(
                                              width: 170,
                                              child: Text("First Name", style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'GTWalsheimPro',
                                                  fontWeight: FontWeight.w500,
                                                  color: BestRateColorConstant.darkBlack),)),
                                          Container(
                                              width: 170,
                                              child: const Text("Last Name", style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'GTWalsheimPro',
                                                  fontWeight: FontWeight.w500,
                                                  color: BestRateColorConstant.darkBlack)))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(20,10,20,0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: _firstNameController,
                                              maxLines: 1,
                                              validator: Validators.validateFirstName,
                                              keyboardType: TextInputType.text,
                                              onChanged: (value){
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
                                              maxLines: 1,
                                              validator: Validators.validateLastName,
                                              keyboardType: TextInputType.text,
                                              onChanged: (value){
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
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(20,30,20,0),
                                      child: Row(
                                        children: [
                                          Text("Email Address*", style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'GTWalsheimPro',
                                              fontWeight: FontWeight.w500,
                                              color: BestRateColorConstant.darkBlack),),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(20,10,20,0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              enabled: false,
                                              controller: _emailController,
                                              keyboardType: TextInputType.emailAddress,
                                              maxLines: 1,
                                              validator: Validators.validateEmail,
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
                                        ],
                                      ),
                                    ),

                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(20,30,20,0),
                                      child: Row(
                                        children: [
                                          Text("Mobile Number*", style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'GTWalsheimPro',
                                              fontWeight: FontWeight.w500,
                                              color: BestRateColorConstant.darkBlack),),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(20,10,20,0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              enabled: false,
                                              controller: _mobileController,
                                              maxLength: 10,
                                              maxLines: 1,
                                              keyboardType: TextInputType.number,
                                              validator: Validators.validatePhone,
                                              onChanged: (value){
                                                var no = int.parse(value);

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

                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(20,10,20,0),
                                      child: Row(
                                        children: [
                                          Text("Area*", style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'GTWalsheimPro',
                                              fontWeight: FontWeight.w500,
                                              color: BestRateColorConstant.darkBlack),),
                                        ],
                                      ),
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
                                        child: areaProvider.areaData?.data != null ? DropdownButtonHideUnderline(
                                          child: DropdownButton2<AreaData>(
                                            isExpanded: true,
                                            hint:  Text(
                                              profileProvider.profileModel?.data?.area ?? "No data Selected",
                                              style: const TextStyle(
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
                                              userArea  = _selectedValue?.location;
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
                                        ): Text("No data found")
                                      ),
                                    ),

                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(20,30,20,0),
                                      child: Row(
                                        children: [
                                          Text("Pin Code*", style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'GTWalsheimPro',
                                              fontWeight: FontWeight.w500,
                                              color: BestRateColorConstant.darkBlack),),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(20,10,20,0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: _pinController,
                                              maxLength: 6,
                                              maxLines: 1,
                                              keyboardType: TextInputType.number,
                                              validator: Validators.validatePin,
                                              onChanged: (value){
                                                var no = int.parse(value);

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
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(20,30,20,0),
                                      child: Row(
                                        children: [
                                          Text("Are you a Business?", style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'GTWalsheimPro',
                                              fontWeight: FontWeight.w500,
                                              color: BestRateColorConstant.darkBlack),),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(5,0,20,0),
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
                                            },
                                            activeColor: Colors.black,
                                          ),
                                          const Text('No' , style: TextStyle(fontSize: 18,
                                              fontFamily: 'GTWalsheimPro',
                                              fontWeight: FontWeight.w500,
                                              color: BestRateColorConstant.darkBlack),),

                                          // Display the selected value
                                          // SizedBox(width: 20.0),
                                          // Text('Selected Value: $selectedValue'),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible: selectedValue == "No"
                                        ? false
                                        : true,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(20,20,20,0),
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
                                            padding: const EdgeInsets.fromLTRB(20,10,20,0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: TextFormField(
                                                    controller: _businessNameController,
                                                    maxLines: 1,
                                                    keyboardType: TextInputType.text,
                                                    validator: Validators.validateBusinessName,
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
                                              ],
                                            ),
                                          ),

                                          const Padding(
                                            padding: EdgeInsets.fromLTRB(20,30,20,0),
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
                                            padding: const EdgeInsets.fromLTRB(20,10,20,0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: TextFormField(
                                                    controller: _gstinController,
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
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),


                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(20,30,20,20),
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints.tightFor(width: 370, height: 55),

                                        child: ElevatedButton(
                                          onPressed: () {
                                            if (_formKey.currentState!.validate()){
                                               if (selectedValue == "Option 1"){
                                                 ShowToast.showToastError("Please select Business Entity!!");
                                               }else{
                                                 setState(() {
                                                   var pincode = int.parse(_pinController.text);
                                                   var mobileNo = int.parse(_mobileController.text);
                                                   var buyer_id = int.parse(buyerId!);
                                                   var user_id = int.parse(userId!);
                                                   requestUpdateProfileModel.userId = user_id;
                                                   requestUpdateProfileModel.buyerid = buyer_id;
                                                   requestUpdateProfileModel.firstName = _firstNameController.text;
                                                   requestUpdateProfileModel.lastName = _lastNameController.text;
                                                   requestUpdateProfileModel.email = _emailController.text;
                                                   requestUpdateProfileModel.mobileNumber = mobileNo;
                                                   requestUpdateProfileModel.area = userArea ?? "";
                                                   requestUpdateProfileModel.pincode = pincode;
                                                   requestUpdateProfileModel.entity = selectedValue;
                                                   requestUpdateProfileModel.businessName = _businessNameController.text;
                                                   requestUpdateProfileModel.gst = _gstinController.text;
                                                   requestUpdateProfileModel.password = 123456;
                                                 });
                                                 print("Data : $requestUpdateProfileModel");
                                                 getUpdateProfile(token!, requestUpdateProfileModel);
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
                                          child: const Text("Update", style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'GTWalsheimPro',
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white
                                          ),),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            )

                          ],
                        ),
                      ),
                      if (profileProvider.isLoading)
                        Container(
                          // width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.black.withOpacity(0.5),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                    ],
                  ):Container(
                      height: MediaQuery.of(context).size.height,
                      width:  MediaQuery.of(context).size.width,
                      color: Colors.white.withOpacity(0.5),
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.wifi_off,
                              size: 50,
                              color:  Colors.red,),
                            Text("You are not connected to the internet",
                              style: TextStyle(fontSize: 16, color: Colors.black),)
                          ],
                        ),
                      )
                  )
                );
              }
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

  Future<void> getProfile(String token, int buyerId) async{
    final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    await profileProvider.getProfile(token, buyerId);
    if (profileProvider.profileModel!.statusCode == 200 && profileProvider.profileModel!.status == true){
      _firstNameController.text = profileProvider.profileModel?.data?.firstName ?? "no data";
      _lastNameController.text = profileProvider.profileModel?.data?.lastName ?? "no data";
      _emailController.text = profileProvider.profileModel?.data?.email ?? "no data";
      _mobileController.text = profileProvider.profileModel?.data?.mobileNumber ?? "no data";
      _pinController.text = profileProvider.profileModel?.data?.pincode ?? "no data";
      _businessNameController.text = profileProvider.profileModel?.data?.businessName ?? "no data";
      _gstinController.text = profileProvider.profileModel?.data?.gst ?? "no data";
      userArea =  profileProvider.profileModel?.data?.area ?? "";
      setState(() {
        selectedValue = profileProvider.profileModel?.data?.entity ?? "";
      });

    }
  }

  Future<void> getUpdateProfile(String token, RequestUpdateProfileModel requestUpdateProfile) async{
    final updateProfileProvider = Provider.of<ProfileProvider>(context, listen: false);
    await updateProfileProvider.getUpdateProfile(token, requestUpdateProfile);
    if (updateProfileProvider.updateProfileModel?.statusCode == 200 && updateProfileProvider.updateProfileModel?.status == true){
      var buyer_id = int.parse(buyerId!);
      getProfile(token, buyer_id);
    }
  }


}
