import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.green, size: 40),
              ),
              const SizedBox(height: 24),
              Text(
                'Payment done successfully.',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF73658),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                  ),
                  onPressed: () {
                    // Pop dialog and route back to Home
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: Text('Done', style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w600)),
                ),
              )
            ],
          ),
        ),
      );
    }
  );
}
