import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stylish/providers/cart_provider.dart';

class CheckoutSummaryScreen extends StatelessWidget {
  const CheckoutSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final items = cart.items;

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
              // Delivery Address
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text('Delivery Address', style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(height: 16),

              // Address Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, spreadRadius: 1)]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text('Address:', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 14)),
                      const Icon(Icons.edit, color: Colors.blue, size: 18),
                    ]),
                    const SizedBox(height: 8),
                    Text('216 St Paul\'s Rd, London N1 2LL, UK', style: GoogleFonts.montserrat(color: Colors.black87, fontSize: 13)),
                    const SizedBox(height: 4),
                    Text('Contact: +44-784232', style: GoogleFonts.montserrat(color: Colors.black87, fontSize: 13)),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Shopping List
              Text('Shopping List (${items.length} items)', style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 16),

              ...items.map((cartItem) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _buildShoppingItem(
                      image: cartItem.product.image,
                      title: cartItem.product.title,
                      subtitle: cartItem.product.category,
                      price: '₹${(cartItem.product.price * cartItem.quantity).toStringAsFixed(0)}',
                      size: cartItem.size,
                      quantity: cartItem.quantity,
                    ),
                  )),

              const SizedBox(height: 16),

              // Order summary
              const Divider(),
              const SizedBox(height: 8),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Subtotal', style: GoogleFonts.montserrat(fontSize: 14, color: Colors.grey.shade600)),
                Text('₹ ${cart.totalPrice.toStringAsFixed(2)}', style: GoogleFonts.montserrat(fontSize: 14, color: Colors.grey.shade600)),
              ]),
              const SizedBox(height: 8),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Shipping', style: GoogleFonts.montserrat(fontSize: 14, color: Colors.grey.shade600)),
                Text('₹ 30', style: GoogleFonts.montserrat(fontSize: 14, color: Colors.grey.shade600)),
              ]),
              const SizedBox(height: 8),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Total', style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('₹ ${(cart.totalPrice + 30).toStringAsFixed(2)}', style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold)),
              ]),

              const SizedBox(height: 32),
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
            onPressed: () => Navigator.pushNamed(context, '/checkout_payment'),
            child: Text('Next', style: GoogleFonts.montserrat(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
          ),
        ),
      ),
    );
  }

  Widget _buildShoppingItem({
    required String image,
    required String title,
    required String subtitle,
    required String price,
    required String size,
    required int quantity,
  }) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 1)]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
            child: Image.network(image, width: 100, height: 120, fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Container(width: 100, height: 120, color: Colors.grey[200], child: const Icon(Icons.image))),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text(subtitle, style: GoogleFonts.montserrat(fontSize: 10, color: Colors.black54), maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 8),
                  Row(children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: const Color(0xFFF2F2F2), borderRadius: BorderRadius.circular(4)),
                      child: Text('Size $size', style: GoogleFonts.montserrat(fontSize: 10, fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: const Color(0xFFF2F2F2), borderRadius: BorderRadius.circular(4)),
                      child: Text('Qty $quantity', style: GoogleFonts.montserrat(fontSize: 10, fontWeight: FontWeight.w600)),
                    ),
                  ]),
                  const SizedBox(height: 8),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Flexible(
                      child: Text('Delivery by 10 May', style: GoogleFonts.montserrat(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black), maxLines: 1, overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(width: 8),
                    Text(price, style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
                  ]),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
