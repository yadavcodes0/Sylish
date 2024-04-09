import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish/screens/login/widgets/buttons/button.dart';
import 'package:stylish/screens/login/widgets/buttons/logo_button.dart';
import 'package:stylish/screens/signup/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
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

                Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
                        } else if (!value.contains("@gmail.com")) {
                          return "Please enter a valid email";
                        }
                        return null;
                      },
                      cursorColor: const Color(0xFFF83758),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            strokeAlign: BorderSide.strokeAlignOutside,
                            style: BorderStyle.solid,
                            color: Color(0xFFF83758),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 243, 243, 243),
                        hintText: "Username or Email",
                        hintStyle: GoogleFonts.montserrat(
                          color: const Color(0xFF676767),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        prefixIcon: SvgPicture.asset(
                          "assets/icons/User.svg",
                          fit: BoxFit.none,
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            strokeAlign: BorderSide.strokeAlignOutside,
                            style: BorderStyle.solid,
                            color: Color(0xFFA8A8A9),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Password field
                    TextFormField(
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
                      obscureText: !showPassword,
                      cursorColor: const Color(0xFFF83758),
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          child: showPassword
                              ? SvgPicture.asset(
                                  "assets/icons/eye.svg",
                                  fit: BoxFit.none,
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  color: Color(0xff626262),
                                ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            strokeAlign: BorderSide.strokeAlignOutside,
                            style: BorderStyle.solid,
                            color: Color(0xFFF83758),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 243, 243, 243),
                        hintText: "Password",
                        hintStyle: GoogleFonts.montserrat(
                          color: const Color(0xFF676767),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        prefixIcon: SvgPicture.asset(
                          "assets/icons/lock.svg",
                          fit: BoxFit.none,
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            strokeAlign: BorderSide.strokeAlignOutside,
                            style: BorderStyle.solid,
                            color: Color(0xFFA8A8A9),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // forgot password button
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.montserrat(
                          color: const Color(0xFFF73658),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 52),

                // login button
                Button(
                  buttonName: "Login",
                  onTap: () {},
                ),

                const SizedBox(height: 80),

                // or continue with
                Text(
                  '- OR Continue with -',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    color: const Color(0xFF575757),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 20),

                // sign in with google + apple + facebook buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    LogoButton(
                      imagePath: "assets/icons/google.png",
                      onTap: () {},
                    ),
                    const SizedBox(width: 10),

                    // apple button
                    LogoButton(
                      imagePath: "assets/icons/apple.png",
                      onTap: () {},
                    ),
                    const SizedBox(width: 10),

                    // facebook button
                    LogoButton(
                      imagePath: "assets/icons/facebook.png",
                      onTap: () {},
                    ),
                  ],
                ),

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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.montserrat(
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
