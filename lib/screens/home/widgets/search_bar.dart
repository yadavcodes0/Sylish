import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        shadows: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          hintText: "Search any Product..",
          hintStyle: GoogleFonts.montserrat(
            color: const Color(0xFFBBBBBB),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          fillColor: const Color(0xffffffff),
          prefixIcon: SvgPicture.asset(
            "assets/icons/search.svg",
            fit: BoxFit.none,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          suffixIcon: SvgPicture.asset(
            "assets/icons/mic.svg",
            fit: BoxFit.none,
          ),
        ),
      ),
    );
  }
}
