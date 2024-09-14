import 'package:flutter/material.dart';

class CustomeTextFiled extends StatelessWidget {
  CustomeTextFiled(
      {this.onChanged,
      super.key,
      required this.hintText,
      this.obscure = false});
  final String hintText;
  Function(String)? onChanged;
  bool? obscure;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        obscureText: obscure!,
        validator: (data) {
          if (data!.isEmpty) {
            return 'field is required';
          }
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
