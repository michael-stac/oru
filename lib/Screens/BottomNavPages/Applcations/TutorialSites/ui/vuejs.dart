import 'package:flutter/material.dart';
import 'package:gigi/Screens/Styles/colors.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class VueJs extends StatefulWidget {
  const VueJs({Key? key}) : super(key: key);

  @override
  State<VueJs> createState() => _VueJsState();
}

class _VueJsState extends State<VueJs> {
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
              'https://www.youtube.com/watch?v=qZXt1Aom3Cs',
              onProgress: (progress) => setState(
                    () {
                  webProgress = progress / 100;
                },
              ),
            ),
          ),
          webProgress < 1
              ?  SizedBox(
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
