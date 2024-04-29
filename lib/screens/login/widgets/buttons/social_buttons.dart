import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'logo_button.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
