import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twittly_app/home/home_view.dart';
import 'package:flutter_twittly_app/home/login_screen.dart';
import 'package:flutter_twittly_app/home/splash_screen.dart';

import 'package:flutter_twittly_app/home/tabbar_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: TwitterTabbarView(),
      theme: ThemeData.light().copyWith(
        appBarTheme:
            AppBarTheme(color: Theme.of(context).scaffoldBackgroundColor),
        tabBarTheme: const TabBarTheme(
            labelColor: CupertinoColors.systemPink,
            unselectedLabelColor: CupertinoColors.systemGrey),
      ),
    );
  }
}
