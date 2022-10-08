import 'package:flutter/material.dart';
import 'package:gigi/Screens/Styles/colors.dart';

import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class Flutter extends StatefulWidget {
  const Flutter({Key? key}) : super(key: key);

  @override
  State<Flutter> createState() => _FlutterState();
}

class _FlutterState extends State<Flutter> {
  @override
  Widget build(BuildContext context) {
    double webProgress = 0;
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
                'https://www.youtube.com/watch?v=I9ceqw5Ny-4&list=PLSzsOkUDsvdtl3Pw48-R8lcK2oYkk40cm',
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
        ));
  }
}
