import 'package:flutter/material.dart';

import '../utils/my_theme.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.splash,
      body: Container(
        height: _size.height,
        width: _size.width,
        child: Column(
          children: [
            Image.asset("assets/images/splash_icon.png",
              height: 100,
              width: 800,),
          ],
        ),
      ),
    );
  }
}
