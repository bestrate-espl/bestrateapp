

import 'package:bestrateapp/providers/create_inquiries_provider.dart';
import 'package:bestrateapp/utils/Validators.dart';
import 'package:bestrateapp/utils/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/best_rate_color_constant.dart';
import '../../models/store_search_business_data.dart';
import '../../providers/search_business_provider.dart';
import '../../sharedpreference/SharedPreferenceHelper.dart';
import '../../sharedpreference/sharedpreference_constant.dart';
class CreateInquiry extends StatefulWidget {
  const CreateInquiry({super.key});

  @override
  State<CreateInquiry> createState() => _CreateInquiryState();
}

class _CreateInquiryState extends State<CreateInquiry> {
  final _formKey = GlobalKey<FormState>();
  final _quantityTextController = TextEditingController();
  final _startBudgetTextController = TextEditingController();
  final _endBudgetTextController = TextEditingController();
  final _descriptionTextController = TextEditingController();
  String? keywordData = "Enter";
  int? keywordDataId = 0;
  String? buyerId;
  String? token;
  SearchBusinessData? _searchBusinessData;
  List<SearchBusinessData> searchDataList = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // Show alert dialog after the first frame is displayed
      buyerId = await SharedPreferenceHelper.getData(SharedPreferenceConstant.BUYER_ID);
      token = await SharedPreferenceHelper.getData(SharedPreferenceConstant.USER_TOKEN);
      setState(() {});
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _quantityTextController.dispose();
    _descriptionTextController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CreateInquiriesProvider>(builder: (context,createInquiriesProvider,_) {
        return Consumer<SearchBusinessProvider>(builder: (context, searchBusinessProvider,_) {
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text("Product", style: TextStyle(fontSize: 18,
                                fontFamily: 'GTWalsheimPro',
                                fontWeight: FontWeight.w500,
                                color: BestRateColorConstant.darkBlack),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async{
                            await getBusiness("").then((value) =>  _selectBusiness(context));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 8.0),
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Colors.grey, // Border color
                                  width: 1.0, // Border width
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.search),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        "${keywordData}",
                                        style: const TextStyle(fontSize: 16,
                                            fontFamily: 'GTWalsheimPro',
                                            fontWeight: FontWeight.w500,
                                            color: BestRateColorConstant.appSecondaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Padding(
                        //   padding: const EdgeInsets.only(left: 10,top: 8.0),
                        //   child: SizedBox(
                        //     height: 40,
                        //     child: ListView.builder(
                        //         scrollDirection: Axis.horizontal,
                        //         itemCount: searchBusinessProvider.getBusinessName.length,
                        //         itemBuilder: (context, index){
                        //           return Padding(
                        //             padding: const EdgeInsets.only(left: 8.0),
                        //             child: Container(
                        //               decoration: BoxDecoration(
                        //                 color: BestRateColorConstant.darkBlack,
                        //                 borderRadius: BorderRadius.circular(50.0),
                        //               ),
                        //               child: Row(
                        //                 // mainAxisSize: MainAxisSize.min,
                        //                 children: [
                        //                   Padding(
                        //                     padding: const EdgeInsets.all(10.0),
                        //                     child: Center(child: Text(searchBusinessProvider.getBusinessName[index] ?? "",
                        //                       style:  const TextStyle(color: BestRateColorConstant.cardBg,fontSize: 14,
                        //                           fontFamily: 'GTWalsheimPro',
                        //                           fontWeight: FontWeight.w500,),)),
                        //                   ),
                        //                   Padding(
                        //                     padding:  const EdgeInsets.only(right: 8.0),
                        //                     child: GestureDetector(
                        //                       onTap: (){
                        //                         searchBusinessProvider.removeListData(searchBusinessProvider.getBusinessName[index] ?? "",
                        //                             searchBusinessProvider.getBusinessIds[index] ?? 0);
                        //                       },
                        //                       child: Container(
                        //                         decoration: BoxDecoration(
                        //                           color: BestRateColorConstant.cardBg,
                        //                           borderRadius: BorderRadius.circular(50.0),
                        //                         ),
                        //                         child: const Icon(Icons.close_outlined, color: BestRateColorConstant.darkBlack, size: 20,),
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //           );
                        //
                        //         }),
                        //   ),
                        // ),

                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text("Quality", style: TextStyle(fontSize: 18,
                                  fontFamily: 'GTWalsheimPro',
                                  fontWeight: FontWeight.w500,
                                  color: BestRateColorConstant.darkBlack),
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                            child:TextFormField(
                              controller: _quantityTextController,
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                              validator: Validators.validateQuantity,
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
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20,30,20,0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: 170,
                                  child: Text("Budget Start", style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'GTWalsheimPro',
                                      fontWeight: FontWeight.w500,
                                      color: BestRateColorConstant.darkBlack),)),
                              SizedBox(
                                  width: 170,
                                  child: Text("Budget End", style: TextStyle(
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
                                  controller: _startBudgetTextController,
                                  maxLines: 1,
                                  validator: Validators.validateBudgetStart,
                                  keyboardType: TextInputType.number,
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
                                  controller: _endBudgetTextController,
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  validator: Validators.validateBudgetEnd,
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
                          padding: EdgeInsets.only(top: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text("Description", style: TextStyle(fontSize: 18,
                                  fontFamily: 'GTWalsheimPro',
                                  fontWeight: FontWeight.w500,
                                  color: BestRateColorConstant.darkBlack),
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                            child: TextFormField(
                              controller: _descriptionTextController,
                              maxLines: 1,
                              keyboardType: TextInputType.text,
                              validator: Validators.validateDescription,
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
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text("Upload Photo(s)", style: TextStyle(fontSize: 18,
                                  fontFamily: 'GTWalsheimPro',
                                  fontWeight: FontWeight.w500,
                                  color: BestRateColorConstant.darkBlack),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 332,
                              child: Padding(padding: EdgeInsets.fromLTRB(20, 10, 5, 0),
                                  child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          border: Border.all(
                                              color: BestRateColorConstant.appSecondaryColor,
                                              width: 1)),
                                      child:  Padding(
                                        padding: EdgeInsets.only(left: 8.0, top: 10),
                                        child: Text(
                                          createInquiriesProvider.fileName ?? "Browse",
                                          style: const TextStyle(
                                              color: BestRateColorConstant.appSecondaryColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ))
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                createInquiriesProvider.uploadFile();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Image.asset('assets/images/file_icon.png'),
                              ),
                            ),

                          ],
                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints.tightFor(width: 350, height: 55),

                            child: ElevatedButton(
                              onPressed: (){
                               if (_formKey.currentState!.validate()){
                                 if (keywordDataId == 0){
                                   ShowToast.showToastError("Please select product!!");
                                 }else if (createInquiriesProvider.filePath == null){
                                   ShowToast.showToastError("Please select .pdf file");
                                 }else{
                                   print("Id : $keywordDataId");
                                   getCreateInquiries(token!, buyerId!, keywordDataId!,
                                       _quantityTextController.text.toString(), _descriptionTextController.text.toString(),
                                       _startBudgetTextController.text.toString(), _endBudgetTextController.text.toString(),
                                       createInquiriesProvider.filePath!, createInquiriesProvider.fileName!);
                                 }
                               }
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
                              child: const Text("Create Inquiries"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (createInquiriesProvider.isLoading)
                      Container(
                        // width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Colors.black.withOpacity(0.5),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }
        );
      }
    );
  }
  Future<void> getCreateInquiries(String token, String buyerId, int keywordId, String quantity,
      String description, String startBudget, String endBudget ,String filePath, String fileName) async{
    final createInquiriesProvider = Provider.of<CreateInquiriesProvider>(context, listen: false);
    await createInquiriesProvider.getCreateInquiries(token, buyerId, keywordId, quantity, description, startBudget, endBudget, filePath, fileName);
    if (createInquiriesProvider.createInquiriesModel!.statusCode == 200 &&
        createInquiriesProvider.createInquiriesModel!.status == true){
      keywordData = "Enter";
      _quantityTextController.text = "";
      _startBudgetTextController.text = "";
      _endBudgetTextController.text = "";
      _descriptionTextController.text = "";
    }
  }
  Future<void> getBusiness(String searchKey) async {
    final searchBusiness = Provider.of<SearchBusinessProvider>(context, listen: false);
    await searchBusiness.getSearchBusiness(searchKey);
  }


  Future _selectBusiness(BuildContext context){
    final searchBusiness = Provider.of<SearchBusinessProvider>(context, listen: false);
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      barrierColor: Colors.black87.withOpacity(0.5),
      // isDismissible: false,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) => Container(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (value){
                  getBusiness(value);
                },
                decoration: InputDecoration(
                  hintText: 'Enter',
                  contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: searchBusiness.businessModel!.matchedKeywords != null ? ListView.builder(
                          itemCount: searchBusiness.businessModel!.matchedKeywords?.length,
                          itemBuilder: (context, index){
                            return GestureDetector(
                              onTap: (){
                                // getBusinessIds.add(_searchBusiness.businessModel?.matchedKeywords?[index].id ?? 0);
                                _searchBusinessData = SearchBusinessData(id: searchBusiness.businessModel?.matchedKeywords?[index].id ?? 0,
                                    name: searchBusiness.businessModel?.matchedKeywords?[index].name ?? "");
                                searchBusiness.getListData(_searchBusinessData!);
                                // requestModel.keywords = searchBusiness.getBusinessIds.cast<int>();
                                keywordData = searchBusiness.businessModel?.matchedKeywords?[index].name ?? "";
                                keywordDataId = searchBusiness.businessModel?.matchedKeywords?[index].id ?? 0;
                                print("get Data : ${searchBusiness.getBusinessIds.cast<int>()}");
                                Navigator.pop(context);

                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: Text(searchBusiness.businessModel!.matchedKeywords![index].name ?? "", style: TextStyle(fontSize: 16, color: Colors.black),),
                              ),
                            );


                          }): Text("No data found")
                  ))
            ],
          ),
        ),
      ),
    );
  }


}

