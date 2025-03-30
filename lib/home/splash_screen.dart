import 'package:flutter/material.dart';
import 'package:flutter_twittly_app/home/tabbar_view.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TwitterTabbarView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.purple,
      body: Align(
        alignment: const Alignment(0, -0.2),
        child: Column(
          children: [
            Lottie.asset(
              "assets/animation_splash.json",
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.6,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
