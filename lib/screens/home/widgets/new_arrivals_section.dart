import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewArrivalsSection extends StatelessWidget {
  const NewArrivalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        // Summer Sale Banner Placeholder
        Container(
          width: double.infinity,
          height: screenWidth > 600 ? 250 : screenWidth * 0.4,
          decoration: BoxDecoration(
            color: const Color(0xFFFDE9E6), // Light peach background
            borderRadius: BorderRadius.circular(8),
            image: const DecorationImage(
              image: NetworkImage('https://images.unsplash.com/photo-1523381294911-8d3cead13475?w=600'), // Placeholder
              fit: BoxFit.cover,
            )
          ),
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.network('https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg', fit: BoxFit.contain, errorBuilder: (_,__,___) => const Text('HOT SUMMER SALE', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.redAccent))),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Title and Button Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New Arrivals',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Summer\' 25 Collections',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFD6E87),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'View all',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.arrow_forward, color: Colors.white, size: 14),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
