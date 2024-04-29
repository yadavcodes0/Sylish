import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish/screens/login/widgets/buttons/button.dart';
import 'package:stylish/screens/login/widgets/textfiled.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // heading
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 83,
                  child: Text(
                    "Forgot\nPassword?",
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

              // email field
              CustomTextFormField(
                hintText: "Enter your email address",
                prefixiconPath: "assets/icons/mail.svg",
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

              const SizedBox(height: 26),

              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '*',
                      style: GoogleFonts.montserrat(
                        color: const Color(0xFFFF4B26),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text:
                          ' We will send you a message to set or reset \n your new password',
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

              const SizedBox(height: 32),

              // submit button
              Button(
                buttonName: "Submit",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
