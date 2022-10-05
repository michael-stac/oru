import 'package:flutter/material.dart';

import '../Styles/colors.dart';

class Pages extends StatefulWidget {
  final String? description;
  final String? imagePath;
  final String? title;
  Pages({this.description, this.title, this.imagePath, Key? key})
      : super(key: key);
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        //Image
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image(
            image: AssetImage(widget.imagePath!),
            fit: BoxFit.cover,
          ),
        ),

        const Spacer(),

        ///Title
        Container(
          alignment: Alignment.center,
          child: Text(
            widget.title!,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24,
                color: AppColor.primaryColor,
                fontFamily: 'Audiowide'),
          ),
        ),
        //Description
        SizedBox(height: 8,),
        Container(
          alignment: Alignment.center,
          child: Text(
            widget.description!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: AppColor.black),
          ),
        ),
      ],
    );
  }
}
