import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medic_app/utils/apis/server.dart';
import 'package:medic_app/utils/essentials/appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../utils/essentials/futureWait.dart';

class Diagonose extends StatefulWidget {
  final String title;

  const Diagonose(this.title,{Key key, }) : super(key: key);
  @override
  DiagonoseState createState() => DiagonoseState();
}

class DiagonoseState extends State<Diagonose> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
bool isLoading=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: inAppBar("${widget.title} Diagnose"),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: WebView(
        initialUrl: PREDICT_LIFE+"${widget.title.toLowerCase()}",
        onPageFinished: (fin){
          setState(() {
            isLoading=false;
          });
        },
      ),
              ),
      isLoading?Center(
        child: LoadingHeart(),
      ):Container()
            ],
          ),
    );
  }
}