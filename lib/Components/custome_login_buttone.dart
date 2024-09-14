import 'package:flutter/material.dart';

class CustomeLoginButtone extends StatelessWidget {
   CustomeLoginButtone({this.onTap ,super.key, required this.text});
  final String text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        width: 370,
        height: 50,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
