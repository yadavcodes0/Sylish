import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscountCards extends StatelessWidget {
  const DiscountCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: ShapeDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/card1.jpg'),
          fit: BoxFit.cover,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              '50-40% OFF',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                height: 0.06,
              ),
            ),
            const SizedBox(height: 26),
            Text(
              'Now in (Product)',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 0.11,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'All colours',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 0.11,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 32,
              width: 100,
              decoration: ShapeDecoration(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                  side: const BorderSide(
                    width: 1,
                    color: Colors.white,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Shop Now',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      height: 0.11,
                    ),
                  ),
                  const SizedBox(width: 4),
                  SvgPicture.asset(
                    "assets/icons/arrow.svg",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
