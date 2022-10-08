import 'package:flutter/material.dart';
import 'package:gigi/Screens/Styles/colors.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class React extends StatefulWidget {
  const React({Key? key}) : super(key: key);

  @override
  State<React> createState() => _ReactState();
}

class _ReactState extends State<React> {
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
              'https://www.youtube.com/watch?v=bMknfKXIFA8',
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
