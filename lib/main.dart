import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:stylish/screens/login/login_screen.dart";

void main() {
  runApp(
    const AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Stylish(),
    ),
  );
}

class Stylish extends StatelessWidget {
  const Stylish({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const LoginScreen(),
      },
    );
  }
}
