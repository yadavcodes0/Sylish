import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SponsoredSection extends StatelessWidget {
  const SponsoredSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sponserd',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 4,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.network(
                  'https://fakestoreapi.com/img/71li-ujtlHZ._AC_UX679_.jpg', // Placeholder for shoe banner
                  height: screenWidth > 600 ? 350 : screenWidth * 0.6,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: screenWidth > 600 ? 350 : screenWidth * 0.6,
                    color: Colors.brown[300],
                    child: Center(
                      child: Text(
                        'UP TO\n50% OFF',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'up to 50% Off',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
