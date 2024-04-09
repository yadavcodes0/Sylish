import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../login/login_screen.dart';

class OnboardingScreenWidget extends StatelessWidget {
  const OnboardingScreenWidget({
    super.key,
    required this.imageUrl,
    required this.tittle,
    required this.description,
    required this.index,
  });

  final int index;
  final String imageUrl;
  final String tittle;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: (index + 1).toString(),
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '/3',
                          style: GoogleFonts.montserrat(
                            color: const Color(0xFFA0A0A1),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Skip",
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 100),

              // image
              SizedBox(
                height: 300,
                child: Image.asset(imageUrl),
              ),

              const SizedBox(height: 15),

              // tittle
              Text(
                tittle,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 10),

              // description
              Text(
                "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: const Color(0xFFA8A8A9),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1.7,
                  letterSpacing: 0.28,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
