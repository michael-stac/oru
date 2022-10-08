import 'package:flutter/material.dart';
import 'package:gigi/Widgets/custom_button.dart';

import '../../Styles/colors.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('Messages'),
                Spacer(),
                Icon(Icons.search),
                SizedBox(width: 10),
                Image.asset('assets/images/edit.png')

              ],
            )
          ],
        ),
      ),
    );
  }
}
