import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutProfileScreen extends StatelessWidget {
  const CheckoutProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Checkout', style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/user.jpg'), // placeholder
                      backgroundColor: Color(0xFFE5E5E5),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Color(0xFF3F8CFF),
                        shape: BoxShape.circle
                      ),
                      child: const Icon(Icons.edit, color: Colors.white, size: 14),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 32),
              
              // Personal Details
              Text('Personal Details', style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 16),
              _buildTextField('Email Address', 'aashifashek@gmail.com'),
              const SizedBox(height: 16),
              _buildTextField('Password', '*********', obscureText: true),
              const SizedBox(height: 32),

              // Business Address Details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Business Address Details', style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600)),
                  Text('Change', style: GoogleFonts.montserrat(fontSize: 12, color: const Color(0xFFF73658), fontWeight: FontWeight.w500, decoration: TextDecoration.underline)),
                ],
              ),
              const SizedBox(height: 16),
              _buildTextField('Pincode', '430034'),
              const SizedBox(height: 16),
              _buildTextField('Address', '216 St Paul\'s Rd'),
              const SizedBox(height: 16),
              _buildTextField('City', 'London'),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildTextField('State', 'N1 2LL')),
                  const SizedBox(width: 16),
                  Expanded(child: _buildTextField('Country', 'United Kingdom')),
                ],
              ),
              const SizedBox(height: 32),
              
              // Bank Account Details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Bank Account Details', style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600)),
                  Text('Change', style: GoogleFonts.montserrat(fontSize: 12, color: const Color(0xFFF73658), fontWeight: FontWeight.w500, decoration: TextDecoration.underline)),
                ],
              ),
              const SizedBox(height: 16),
              _buildTextField('Bank Account Number', '2043564903348'),
              const SizedBox(height: 16),
              _buildTextField('Account Holder\'s Name', 'Aashifa Sheik'),
              const SizedBox(height: 16),
              _buildTextField('IFSC Code', 'SBNI000000'),
              const SizedBox(height: 48),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF73658),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                  ),
                  onPressed: () {
                    // Navigate to next checkout step (summary)
                    Navigator.pushNamed(context, '/checkout_summary');
                  },
                  child: Text('Save', style: GoogleFonts.montserrat(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.montserrat(fontSize: 12, color: Colors.black)),
        const SizedBox(height: 8),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.montserrat(fontSize: 14, color: Colors.black87),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300)
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300)
            ),
          ),
        )
      ],
    );
  }
}
