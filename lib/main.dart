import 'package:firebase_core/firebase_core.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mealgenerator/home.dart';
import 'package:provider/provider.dart';

import 'auth_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
 
    
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
        splash: Image(
          image: AssetImage("images/logicon.png"),
        ),
        duration: 3000,
        splashIconSize: 100,
        splashTransition: SplashTransition.rotationTransition,
        nextScreen: MyHomePage(),
        backgroundColor: Color.fromARGB(248, 240, 222, 180),
      ),
        
      ),
    );
  }
   
}

