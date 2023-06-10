import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String txt;
  Color color;
  double fsize;
  CustomText(this.txt, this.color, this.fsize);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(color: color, fontSize: fsize),
    );
  }
}
