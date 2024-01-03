import 'package:flutter/material.dart';
class CreateInquiry extends StatefulWidget {
  const CreateInquiry({super.key});

  @override
  State<CreateInquiry> createState() => _CreateInquiryState();
}

class _CreateInquiryState extends State<CreateInquiry> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("Create Inquiry"),
      ),
    );
  }
}
