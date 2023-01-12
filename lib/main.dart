import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mealgenerator/home.dart';
import 'package:mealgenerator/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: AnimatedSplashScreen(
        splash: Image(
          image: AssetImage("./images/tajine.png"),
        ),
        duration: 3000,
        splashIconSize: 100,
        splashTransition: SplashTransition.rotationTransition,
        backgroundColor: Color.fromARGB(245, 245, 65, 106),
        nextScreen: MyHomePage(title: 'Meal Generator'),
      ),
    );
  }
}
