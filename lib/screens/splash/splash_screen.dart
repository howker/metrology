import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:infopoverka/root_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'ИНФО-ПОВЕРКА',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Lottie.asset('assets/animation/loading_balls.json'),
            const Text(
              'ПОЛУЧЕНИЕ ИНФОРМАЦИИ ИЗ ФГИС АРШИН',
            ),
            const Text(
              'ФЕДЕРАЛЬНОГО ИНФОРМАЦИОННОГО ФОНДА',
            ),
            const Text(
              'ПО ОБЕСПЕЧЕНИЮ ЕДИНСТВА ИЗМЕРЕНИЙ',
            ),
          ],
        ),
        //backgroundColor: Colors.white,
        nextScreen: const RootScreen(),
        splashIconSize: 500,
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.leftToRightWithFade,
        animationDuration: const Duration(seconds: 3),
      ),
    );
  }
}
