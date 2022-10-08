import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

import '../../../../Styles/colors.dart';

class Dart extends StatefulWidget {
  const Dart({Key? key}) : super(key: key);

  @override
  State<Dart> createState() => _DartState();
}

class _DartState extends State<Dart> {
  double webProgress = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,),
      body: Stack(
        children: [
          Expanded(
            child: WebViewPlus(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl:
              'https://www.youtube.com/watch?v=Ky8RxFF4kug',
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
