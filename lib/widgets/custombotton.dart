import 'package:flutter/material.dart';
class CustomeButton extends StatelessWidget {
  CustomeButton({this.onTap,required this.text});
  String text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:onTap ,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff7F508D),
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 60,
        child:
        Center(child: Text(text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
      ),
    );
  }
}