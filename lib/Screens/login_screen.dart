import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/my_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: MyTheme.splash,
      body: Container(
        height: _size.height,
        width: _size.width,
        child: Column(
          children: [
            Image.asset(
              "assets/images/splash_icon.png",
              height: 100,
              width: 800,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Welcome Buddies",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              "Don't miss out! Login to book your seat now.",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.all(19),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              width: _size.width,
              child: Column(
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
