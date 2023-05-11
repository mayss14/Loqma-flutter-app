import 'dart:io';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mealgenerator/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
        splash: Image(
          image: AssetImage("images/log.png"),
        ),
        duration: 3000,
        splashIconSize: 100,
        splashTransition: SplashTransition.rotationTransition,
        nextScreen: MyHomePage(),
        backgroundColor: Color.fromARGB(248, 240, 222, 180),
      ),
    );
  }
}
