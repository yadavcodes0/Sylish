import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialOffersBanner extends StatelessWidget {
  const SpecialOffersBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        // Special Offers row
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Image.asset('assets/images/Rectangle 56.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.local_offer,
                      size: 60, color: Colors.blue)), // Placeholder
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Special Offers',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: screenWidth > 350 ? 16 : 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text('😱'),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'We make sure you get the\noffer you need at best prices',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth > 350 ? 12 : 10,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Flat and Heels Banner
        Container(
          height: screenWidth > 600 ? 250 : screenWidth * 0.45,
          decoration: BoxDecoration(
              color: const Color(0xFFFDFDFD), // Light background
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  blurRadius: 4,
                  spreadRadius: 1,
                )
              ]),
          child: Row(
            children: [
              // Left part with styled/placeholder background pattern and shoe image
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.amber
                      .withValues(alpha: 0.1), // Mocking the speckled gold background
                  child: Center(
                    child: Image.asset('assets/images/Rectangle 55.png',
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.image, size: 50)), // Shoe mockup
                  ),
                ),
              ),
              // Right part with text and button
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Flat and Heels',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth > 350 ? 16 : 12,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Stand a chance to get rewarded',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: screenWidth > 350 ? 10 : 9,
                          color: Colors.black54,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFD6E87),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Visit now',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(Icons.arrow_forward,
                                color: Colors.white, size: 14),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
