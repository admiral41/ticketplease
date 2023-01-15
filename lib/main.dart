import 'package:flutter/material.dart';
import 'package:ticketplease/utils/my_theme.dart';

import 'Screens/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.myLightTheme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


