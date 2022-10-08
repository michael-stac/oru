import 'package:flutter/material.dart';
import 'package:gigi/Screens/Styles/colors.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class UiUxDesigner extends StatefulWidget {
  const UiUxDesigner({Key? key}) : super(key: key);

  @override
  State<UiUxDesigner> createState() => _UiUxDesignerState();
}

class _UiUxDesignerState extends State<UiUxDesigner> {
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
                'https://www.youtube.com/watch?v=zcbLYA6zdck',
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
