// import 'dart:developer';
//
// import 'package:moniepoint_task/helper/app_constants.dart';
// import 'package:moniepoint_task/main.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart' as _widget;
//
// class WebViewPage extends StatefulWidget {
//   final bool showAppBar;
//   WebViewPage({
//     Key? key,
//     this.showAppBar = true,
//   }) : super(key: key);
//
//   @override
//   _WebViewPageState createState() => _WebViewPageState();
// }
//
// class _WebViewPageState extends State<WebViewPage> {
//   bool isLoading = true;
//   late _widget.WebViewController controller;
//
//   @override
//   Widget build(BuildContext context) {
//
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: AppConstants.white,
//         resizeToAvoidBottomInset: false,
//         appBar: widget.showAppBar
//             ? AppBar(
//                 iconTheme: const IconThemeData(color: AppConstants.white),
//                 leading: IconButton(
//                     icon: const Icon(Icons.arrow_back),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     }),
//                 backgroundColor: context.primaryColor(),
//                 elevation: 0.0,
//                 title: Text(
//                   'Payment',
//                   style: context.customStyle(
//                     color: AppConstants.white,
//                     size: 16.0,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               )
//             : null,
//         body: Stack(
//           children: <Widget>[
//             WebView
//             _widget.WebView(
//               initialUrl: getIt<AppPrefs>().webViewUrl.getValue(),
//               onWebViewCreated: (controller) {
//                 this.controller = controller;
//               },
//               onPageFinished: (_) {
//                 print(' WEBPAGE:: $_ loaded');
//                 if (!_.contains('/backPress'))
//                   getIt<AppPrefs>().webViewUrl.setValue(_);
//                 // controller.loadUrl(_);
//                 setState(() {
//                   isLoading = false;
//                 });
//               },
//               gestureNavigationEnabled: true,
//               allowsInlineMediaPlayback: true,
//               javascriptChannels: Set.from([
//                 JavascriptChannel(
//                     name: 'pgURLResponseData',
//                     onMessageReceived: (JavascriptMessage message) {
//                       //This is where you receive message from
//                       //javascript code and handle in Flutter/Dart
//                       //like here, the message is just being printed
//                       //in Run/LogCat window of android studio
//                       log('JAVASCRIPT message-> ${message.message}');
//                     })
//               ]),
//               navigationDelegate: (action) {
//                 log('navigation Delegate:: ${action.url}   ----- ${action.isForMainFrame}');
//                 // launch(action.url);
//                 return NavigationDecision.navigate;
//               },
//               gestureRecognizers: Set()
//                 ..add(Factory<VerticalDragGestureRecognizer>(
//                     () => VerticalDragGestureRecognizer())),
//               javascriptMode: _widget.JavascriptMode.unrestricted,
//               backgroundColor: AppConstants.white,
//             ),
//             if (isLoading) Center(child: loadingIcon(context)),
//           ],
//         ),
//       ),
//     );
//   }
// }
