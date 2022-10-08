import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

import '../../../../Styles/colors.dart';

class JavaScript extends StatefulWidget {
  const JavaScript({Key? key}) : super(key: key);

  @override
  State<JavaScript> createState() => _JavaScriptState();
}

class _JavaScriptState extends State<JavaScript> {
  double webProgress = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(backgroundColor: AppColor.white,
        elevation: 0,
        leading: BackButton(color: Colors.black,),
      ),
      body: Stack(
        children: [
          Expanded(
            child: WebViewPlus(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl:
              'https://www.youtube.com/watch?v=jS4aFq5-91M&t=35s',
              onProgress: (progress) => setState(
                    () {
                  webProgress = progress / 100;
                },
              ),
            ),
          ),
          webProgress < 1
              ? SizedBox(
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: AppColor.primaryColor,
              ),
            ),
          )
              : const SizedBox(),
        ],
      ),);
  }
}
