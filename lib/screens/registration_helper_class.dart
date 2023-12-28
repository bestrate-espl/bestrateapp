import 'package:flutter/cupertino.dart';

class BuyerInformationScreen extends StatefulWidget {
  const BuyerInformationScreen({super.key});

  @override
  State<BuyerInformationScreen> createState() => _BuyerInformationScreenState();
}

class _BuyerInformationScreenState extends State<BuyerInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
       Text("1. Buyer Information Details")
      ],
    );
  }
}

class BusinessDetails extends StatefulWidget {
  const BusinessDetails({super.key});

  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("2. Business Details")
      ],
    );
  }
}

