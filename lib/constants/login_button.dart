import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 70),
        decoration: BoxDecoration(
            color: Colors.orange, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            'Sign In',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
