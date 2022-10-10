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
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                Text('Messages'),
                Spacer(),
                Icon(Icons.search),
                SizedBox(width: 10),
                Image.asset('assets/images/edit.png', height: 30,)

              ],
            ),
            SizedBox(height: 10),
            SizedBox(height: 40, child: TextFormField(decoration: InputDecoration(),),),
            Text('Companies'),
            Row(
              children: [
                Image.asset('assets/images/olutu.png'),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text('olotu Square'),
                        Spacer(),
                        Text('11:45am')
                      ],
                    ),
                    Row(
                      children: const [
                        Text('Are you available for an interv...'),
                        Spacer(),
                        Text('4')
                      ],
                    ),
                    
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
