import 'package:flutter/material.dart';
class MyInquiry extends StatefulWidget {
  const MyInquiry({super.key});

  @override
  State<MyInquiry> createState() => _MyInquiryState();
}

class _MyInquiryState extends State<MyInquiry> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("My Inquiry"),
      ),
    );
  }
}
