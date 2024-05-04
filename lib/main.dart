import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:stylish/screens/forgotPassword/forgot_password.dart";
import "package:stylish/screens/get_started_screen.dart";
import "package:stylish/screens/home/home_screen.dart";
import "package:stylish/screens/login/login_screen.dart";

import "screens/signup/sign_up_screen.dart";

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
    const Stylish(),
  );
}

class Stylish extends StatelessWidget {
  const Stylish({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const HomeScreen(),
        "/login": (context) => const LoginScreen(),
        "/signup": (context) => const SignUpScreen(),
        "/home": (context) => const HomeScreen(),
        "/forgot": (context) => const ForgotPassword(),
        "/start": (context) => const GetStartedScreen(),
      },
    );
  }
}
