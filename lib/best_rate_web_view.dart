// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// class BestRateWebView extends StatefulWidget {
//   const BestRateWebView({super.key, required this.controller});
//
//   final WebViewController controller;
//   @override
//   State<BestRateWebView> createState() => _BestRateWebViewState();
// }
//
// class _BestRateWebViewState extends State<BestRateWebView> {
//   var loadingPrecentage = 0;
//   @override
//   void initState(){
//     super.initState();
//     widget.controller.clearCache();
//     widget.controller..setNavigationDelegate(
//       NavigationDelegate(
//         onPageStarted: (url){
//           setState(() {
//             loadingPrecentage = 0;
//           });
//         },
//         onProgress: (progress){
//           setState(() {
//             loadingPrecentage = progress;
//           });
//         },
//         onPageFinished: (url){
//           setState(() {
//             loadingPrecentage = 100;
//           });
//         }
//       )
//     )..setJavaScriptMode(JavaScriptMode.unrestricted)..addJavaScriptChannel("SnackBar", onMessageReceived: (message){
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message.message)));
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         WebViewWidget(controller: widget.controller),
//         if(loadingPrecentage < 100)
//           LinearProgressIndicator(
//             value: loadingPrecentage / 100.0,
//           )
//       ],
//
//     );
//   }
// }
