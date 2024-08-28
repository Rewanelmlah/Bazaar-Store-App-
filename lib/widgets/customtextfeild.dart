import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomeTextFeild extends StatelessWidget {
  CustomeTextFeild({this.onChanged,this.hintText,this.inputType,this.obscureText=false});
  String? hintText;
  TextInputType? inputType;
  Function(String)?onChanged;
  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      keyboardType: inputType,
      obscureText:obscureText! ,

      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xff7F508D)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(
              color: Color(0xff7F508D)
          ),borderRadius: BorderRadius.circular(8)
          ),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(
              color: Color(0xff7F508D),
          ),borderRadius: BorderRadius.circular(8))
      ),
    );
  }
}