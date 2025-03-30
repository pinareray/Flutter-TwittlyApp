// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  const MyTextField({
    Key? key,
    required this.hintText,
    required this.obscureText,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          fillColor: Colors.white54,
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}
