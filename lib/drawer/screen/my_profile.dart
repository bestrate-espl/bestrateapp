import 'package:flutter/material.dart';
class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("My Profile"),
      ),
    );
  }
}
