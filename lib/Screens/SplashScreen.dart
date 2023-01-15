import 'package:flutter/material.dart';

import '../utils/my_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.splash,
      body: Container(
        child: Center(
          child: Image.asset("assets/images/splash_icon.png"),
        ),
      ),
    );
  }
}
