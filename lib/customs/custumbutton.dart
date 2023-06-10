import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomButton extends StatelessWidget {
  String txt;
  dynamic method;
  double fsize;
  double width;
  double height;

  CustomButton(this.method, this.txt, this.fsize, this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: method,
      style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: width, vertical: height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
      child: Text(
        txt,
        style: TextStyle(fontSize: fsize, color: Colors.black),
      ),
    );
  }
}
