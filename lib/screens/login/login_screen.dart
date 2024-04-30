import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish/screens/get_started_screen.dart';
import 'package:stylish/screens/login/widgets/buttons/button.dart';
import 'package:stylish/screens/login/widgets/textfiled.dart';

import 'widgets/buttons/social_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool showPassword = false;

  moveToHomeScreen(BuildContext context) async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) {
            return const GetStartedScreen();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // heading
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 185,
                      height: 83,
                      child: Text(
                        'Welcome \nBack!\n',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // email and password text fields
                  CustomTextFormField(
                    hintText: "Username or Email",
                    prefixiconPath: "assets/icons/User.svg",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username cannot be empty";
                      } else if (!value.contains("@gmail.com")) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                    isPasswordField: false,
                  ),

                  const SizedBox(height: 30),

                  CustomTextFormField(
                    hintText: "Password",
                    prefixiconPath: "assets/icons/lock.svg",
                    suffixiconPath: "assets/icons/eye.svg",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      } else if (!_isStrongPassword(value)) {
                        return "Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character";
                      }
                      return null;
                    },
                    isPasswordField: true,
                  ),

                  const SizedBox(height: 10),

                  // forgot password button
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/forgot');
                      },
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.montserrat(
                          color: const Color(0xFFF73658),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 52),

                  // login button
                  Button(
                    buttonName: "Login",
                    onTap: () {
                      moveToHomeScreen(context);
                    },
                  ),

                  const SizedBox(height: 80),

                  // google + apple + facebook buttons
                  const SocialButtons(),

                  const SizedBox(height: 30),

                  // sign up button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Create An Account",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.montserrat(
                            decoration: TextDecoration.underline,
                            decorationColor: const Color(0xFFF73658),
                            color: const Color(0xFFF73658),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

bool _isStrongPassword(String password) {
  // Define the regular expressions for each password constraint
  final hasUppercase = RegExp(r'[A-Z]');
  final hasLowercase = RegExp(r'[a-z]');
  final hasDigit = RegExp(r'\d');
  final hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  // Check if the password satisfies all constraints
  return hasUppercase.hasMatch(password) &&
      hasLowercase.hasMatch(password) &&
      hasDigit.hasMatch(password) &&
      hasSpecialChar.hasMatch(password);
}
