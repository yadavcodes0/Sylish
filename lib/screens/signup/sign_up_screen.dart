import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish/screens/login/widgets/buttons/button.dart';
import 'package:stylish/screens/login/widgets/buttons/social_buttons.dart';
import 'package:stylish/screens/login/widgets/textfiled.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
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
                children: [
                  // heading
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 185,
                      height: 83,
                      child: Text(
                        'Create an \naccount\n',
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
                    controller: _passwordController,
                  ),

                  const SizedBox(height: 30),

                  CustomTextFormField(
                    hintText: "Confirm Password",
                    prefixiconPath: "assets/icons/lock.svg",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please confirm your password";
                      } else if (value != _passwordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                    isPasswordField: true,
                    controller: _confirmPasswordController,
                  ),

                  const SizedBox(height: 20),

                  // text
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 258,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'By clicking the ',
                              style: GoogleFonts.montserrat(
                                color: const Color(0xFF676767),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: 'Register',
                              style: GoogleFonts.montserrat(
                                color: const Color(0xFFFF4B26),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            TextSpan(
                              text: ' button, you agree to the public offer',
                              style: GoogleFonts.montserrat(
                                color: const Color(0xFF676767),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // create account button
                  Button(
                    buttonName: "Create Account",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, '/home');
                      }
                    },
                  ),

                  const SizedBox(height: 40),

                  //Social Button
                  const SocialButtons(),

                  const SizedBox(height: 30),

                  // already have an account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "I already have an account",
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
                          "Login",
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
