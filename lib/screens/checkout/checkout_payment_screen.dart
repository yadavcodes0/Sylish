import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stylish/providers/cart_provider.dart';

import 'success_dialog.dart';

class CheckoutPaymentScreen extends StatefulWidget {
  const CheckoutPaymentScreen({super.key});

  @override
  State<CheckoutPaymentScreen> createState() => _CheckoutPaymentScreenState();
}

class _CheckoutPaymentScreenState extends State<CheckoutPaymentScreen> {
  int _selectedPaymentMethod = 0;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final total = cart.totalPrice + 30; // +30 shipping

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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order Summary Box
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Order', style: GoogleFonts.montserrat(fontSize: 14, color: Colors.grey.shade600)),
                Text('₹ ${cart.totalPrice.toStringAsFixed(0)}', style: GoogleFonts.montserrat(fontSize: 14, color: Colors.grey.shade600)),
              ]),
              const SizedBox(height: 12),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Shipping', style: GoogleFonts.montserrat(fontSize: 14, color: Colors.grey.shade600)),
                Text('₹ 30', style: GoogleFonts.montserrat(fontSize: 14, color: Colors.grey.shade600)),
              ]),
              const SizedBox(height: 12),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Total', style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('₹ ${total.toStringAsFixed(0)}', style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold)),
              ]),

              const Padding(padding: EdgeInsets.symmetric(vertical: 24), child: Divider()),

              Text('Payment', style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 16),

              _buildPaymentOption(
                  index: 0,
                  logoWidget: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: const Color(0xFF1E3A8A), borderRadius: BorderRadius.circular(4)),
                    child: Text('VISA', style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                  ),
                  title: '**** **** **** 2109'),
              const SizedBox(height: 16),
              _buildPaymentOption(
                  index: 1,
                  logoWidget: Row(mainAxisSize: MainAxisSize.min, children: [
                    Text('Pay', style: GoogleFonts.montserrat(color: const Color(0xFF003087), fontWeight: FontWeight.bold)),
                    Text('Pal', style: GoogleFonts.montserrat(color: const Color(0xFF009CDE), fontWeight: FontWeight.bold)),
                  ]),
                  title: '******2109'),
              const SizedBox(height: 16),
              _buildPaymentOption(
                  index: 2,
                  logoWidget: const Row(mainAxisSize: MainAxisSize.min, children: [
                    Icon(Icons.credit_card, size: 24, color: Colors.orange),
                  ]),
                  title: '**** **** **** 2109'),
              const SizedBox(height: 16),
              _buildPaymentOption(
                  index: 3,
                  logoWidget: Row(mainAxisSize: MainAxisSize.min, children: [
                    const Icon(Icons.apple, size: 24),
                    const SizedBox(width: 4),
                    Text('Pay', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 16)),
                  ]),
                  title: '**** **** **** 2109'),

              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF73658),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            onPressed: () {
              cart.clearCart();
              showSuccessDialog(context);
            },
            child: Text('Continue', style: GoogleFonts.montserrat(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOption({required int index, required Widget logoWidget, required String title}) {
    final isSelected = _selectedPaymentMethod == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedPaymentMethod = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFF9FAFB) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: isSelected ? const Color(0xFFF73658) : Colors.grey.shade300)),
        child: Row(children: [
          SizedBox(width: 70, child: Align(alignment: Alignment.centerLeft, child: logoWidget)),
          const SizedBox(width: 8),
          Expanded(child: Text(title, style: GoogleFonts.montserrat(fontSize: 14, color: Colors.black87))),
          Icon(isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
              color: isSelected ? const Color(0xFFF73658) : Colors.grey),
        ]),
      ),
    );
  }
}
