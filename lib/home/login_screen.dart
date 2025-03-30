import 'package:flutter/material.dart';
import 'package:flutter_twittly_app/constants/login_button.dart';
import 'package:flutter_twittly_app/constants/my_text_field.dart';
import 'package:flutter_twittly_app/constants/square_tile.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text editing controllers
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign users in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorItem.lavanderBlush,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Lottie.asset("assets/login_screen.json"),
              const Text(
                "Welcome to TwittlyApp",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              MyTextField(
                controller: userNameController,
                hintText: 'Username',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const LoginButton(
                  // onTap:signUserIn,
                  ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                    Text('Or continue with'),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(
                    imagePath: 'assets/google.png',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SquareTile(
                    imagePath: 'assets/facebook_icon.png',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SquareTile(
                    imagePath: 'assets/github_icon.png',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorItem {
  static const Color lavanderBlush = Color.fromARGB(255, 248, 216, 253);
}
