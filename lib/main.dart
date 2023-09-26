// main.dart

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:invoice/model/log.dart';
import 'package:invoice/product.dart';
import 'package:invoice/stack/stack.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProjectProvider()),
      ],
      child: MaterialApp(
          title: 'Flutter Project Calculator',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: AnimatedSplashScreen(
            splash: const Image(
              image: AssetImage(
                "assets/Logo.png",
              ),
            ),
            duration: 3000,
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: const Color.fromRGBO(8, 190, 246, 1),
            nextScreen: Stack(
              children: [
                DrawerScreen(),
                HomeScreen(),
              ],
            ),
          )),
    );
  }
}
//16, 164, 210, 1

