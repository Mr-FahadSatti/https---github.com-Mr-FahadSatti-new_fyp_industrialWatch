import 'package:flutter/material.dart';

class CustomTextForm extends StatefulWidget {
  String hinttext;
  String labeltext;
  bool obsecuretext;
  String? obsecurechar;
  TextEditingController controller;
  Icon icon;
  CustomTextForm(this.hinttext, this.labeltext, this.obsecurechar,
      this.obsecuretext, this.controller, this.icon);

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 20,color: Colors.white,),
      controller: widget.controller,
      obscureText: widget.obsecuretext,
      cursorColor: Colors.white,
      autofocus: true,
      obscuringCharacter:
          widget.obsecurechar != null ? widget.obsecurechar! : "*",
      decoration: InputDecoration(
        fillColor: Colors.white,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(20)),
        hintText: widget.hinttext,hintStyle: TextStyle(color: Colors.white54),
        labelText: widget.labeltext,labelStyle: TextStyle(color: Colors.white60),
        prefixIcon: widget.icon,
      ),
    );
  }
}
