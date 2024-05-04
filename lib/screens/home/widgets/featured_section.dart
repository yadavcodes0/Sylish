import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/lists.dart';

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'All Featured',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                height: 0.07,
              ),
            ),
            const Spacer(),
            Container(
              height: 24,
              width: 60,
              decoration: ShapeDecoration(
                color: const Color(0xffffffff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x0A000000),
                    blurRadius: 9,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sort',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 0.11,
                    ),
                  ),
                  const SizedBox(width: 4),
                  SvgPicture.asset("assets/icons/sort.svg"),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Container(
              height: 24,
              width: 70,
              decoration: ShapeDecoration(
                color: const Color(0xffffffff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x0A000000),
                    blurRadius: 9,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Filter',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 0.11,
                    ),
                  ),
                  const SizedBox(width: 4),
                  SvgPicture.asset("assets/icons/filter.svg"),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          height: 90,
          decoration: ShapeDecoration(
            color: const Color(0xffffffff),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x0A000000),
                blurRadius: 9,
                offset: Offset(0, 2),
                spreadRadius: 0,
              ),
            ],
          ),
          child: ListView.builder(
            itemCount: sections.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(sections[index].imagePath),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      sections[index].title,
                      style: GoogleFonts.montserrat(
                        color: const Color(0xFF21003D),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        height: 0.16,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
