import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish/screens/onboarding/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FlutterSplashScreen.fadeIn(
        backgroundColor: Colors.white,
        duration: const Duration(seconds: 3),
        animationDuration: const Duration(seconds: 2),
        childWidget: SizedBox(
          height: 200,
          width: 200,
          child: SvgPicture.asset("assets/icons/logo.svg"),
        ),
        nextScreen: const OnBoardingScreen(),
      ),
    );
  }
}
