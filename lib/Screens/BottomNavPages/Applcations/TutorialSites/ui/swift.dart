import 'package:flutter/material.dart';
import 'package:gigi/Screens/Styles/colors.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class Swift extends StatefulWidget {
  const Swift({Key? key}) : super(key: key);

  @override
  State<Swift> createState() => _SwiftState();
}

class _SwiftState extends State<Swift> {
  double webprogress = 0;
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
                'https://www.youtube.com/watch?v=comQ1-x2a1Q',
                onProgress: (progress) => setState(
                      () {
                    webprogress = progress / 100;
                  },
                ),
              ),
            ),
            webprogress < 1
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
