import 'package:bestrateapp/provider/on_boarding_provider/on_boarding_provider.dart';
import 'package:bestrateapp/splas_screens/splase_sereen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:webview_flutter/webview_flutter.dart';

import 'best_rate_web_view.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => OnBoardingProvider())
    ],
      builder: (context, child){
      return  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Color(0xFF7258DB)
        ),
        home: SplashScreen(),
        // home: WebViewApp(),
      );
      },
    );



  }

}

// class WebViewApp extends StatefulWidget {
//   const WebViewApp({super.key});
//
//   @override
//   State<StatefulWidget> createState() => _WebViewAppState();
//
// }
//
// class _WebViewAppState extends State<WebViewApp>{
//   late final WebViewController _controller;
//
//   @override
//   void initState(){
//     super.initState();
//     _controller = WebViewController()..loadRequest(
//       Uri.parse('https://bestrate.encureit.com/'),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text("Web View"),
//       //   actions: [
//       //     Row(
//       //       children: [
//       //         IconButton( icon: Icon(Icons.arrow_back_ios),
//       //           onPressed: () async{
//       //           final messenger = ScaffoldMessenger.of(context);
//       //           if(await _controller.canGoBack()){
//       //             await _controller.goBack();
//       //           }
//       //           else{
//       //             messenger.showSnackBar(
//       //               SnackBar(content: Text("No Back History Found")),
//       //             );
//       //             return;
//       //
//       //           }
//       //         },
//       //         ),
//       //         IconButton( icon: Icon(Icons.arrow_forward_ios),
//       //           onPressed: () async{
//       //             final messenger = ScaffoldMessenger.of(context);
//       //             if(await _controller.canGoForward()){
//       //               await _controller.goForward();
//       //             }
//       //             else{
//       //               messenger.showSnackBar(
//       //                 SnackBar(content: Text("No Forward History Found")),
//       //               );
//       //               return;
//       //
//       //             }
//       //           },
//       //         ),
//       //         IconButton(icon: Icon(Icons.replay),
//       //             onPressed: (){
//       //            _controller.reload();
//       //             },
//       //         )
//       //       ],
//       //     ),
//       //   ],
//       // ),
//       body: BestRateWebView(controller: _controller,),
//     );
//   }
//
// }