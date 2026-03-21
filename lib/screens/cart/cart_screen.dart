import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stylish/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final items = cart.items;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Shopping Bag', style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.favorite_border, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: items.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
                  const SizedBox(height: 16),
                  Text('Your bag is empty', style: GoogleFonts.montserrat(fontSize: 18, color: Colors.grey)),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
                    child: Text('Start Shopping', style: GoogleFonts.montserrat(color: const Color(0xFFFD6E87), fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Cart Items
                    ...items.map((cartItem) => _buildCartItem(context, cartItem, cart)),

                    // Apply Coupons
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            const Icon(Icons.local_offer_outlined, color: Colors.black),
                            const SizedBox(width: 8),
                            Text('Apply Coupons', style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w500)),
                          ]),
                          Text('Select', style: GoogleFonts.montserrat(color: const Color(0xFFFD6E87), fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Order Payment Details
                    Text('Order Payment Details', style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),

                    _paymentDetailRow('Order Amounts', '₹ ${cart.totalPrice.toStringAsFixed(2)}'),
                    const SizedBox(height: 12),
                    _paymentDetailRow('Convenience', 'Know More', isAction: true),
                    const SizedBox(height: 12),
                    _paymentDetailRow('Delivery Fee', 'Free', isAction: true),

                    const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider()),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Order Total', style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('₹ ${cart.totalPrice.toStringAsFixed(2)}', style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('EMI Available', style: GoogleFonts.montserrat(fontSize: 14)),
                        Text('Details', style: GoogleFonts.montserrat(fontSize: 14, color: const Color(0xFFFD6E87), fontWeight: FontWeight.bold)),
                      ],
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: items.isEmpty
          ? null
          : Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), offset: const Offset(0, -4), blurRadius: 10)]),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('₹ ${cart.totalPrice.toStringAsFixed(2)}', style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text('View Detailed Bill', style: GoogleFonts.montserrat(fontSize: 12, color: const Color(0xFF3F8CFF), fontWeight: FontWeight.w500)),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFD6E87),
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                      onPressed: () => Navigator.pushNamed(context, '/checkout_profile'),
                      child: Text('Proceed to Payment', style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildCartItem(BuildContext context, CartItem cartItem, CartProvider cart) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 1)]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
            child: Image.network(
              cartItem.product.image,
              width: 100, height: 120, fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => Container(width: 100, height: 120, color: Colors.grey[200], child: const Icon(Icons.image)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(cartItem.product.title,
                            style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600),
                            maxLines: 1, overflow: TextOverflow.ellipsis),
                      ),
                      GestureDetector(
                        onTap: () => cart.removeFromCart(cartItem.product.id),
                        child: const Icon(Icons.close, size: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(cartItem.product.category, style: GoogleFonts.montserrat(fontSize: 10, color: Colors.black54)),
                  const SizedBox(height: 8),
                  Row(children: [
                    _dropdownWidget('Size', cartItem.size),
                    const SizedBox(width: 8),
                    // Quantity controls
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(color: const Color(0xFFF2F2F2), borderRadius: BorderRadius.circular(4)),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        GestureDetector(
                          onTap: () => cart.updateQuantity(cartItem.product.id, cartItem.quantity - 1),
                          child: const Padding(padding: EdgeInsets.all(4), child: Icon(Icons.remove, size: 14)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text('${cartItem.quantity}', style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w600)),
                        ),
                        GestureDetector(
                          onTap: () => cart.updateQuantity(cartItem.product.id, cartItem.quantity + 1),
                          child: const Padding(padding: EdgeInsets.all(4), child: Icon(Icons.add, size: 14)),
                        ),
                      ]),
                    ),
                  ]),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('₹${cartItem.product.price.toStringAsFixed(0)}',
                          style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _dropdownWidget(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: const Color(0xFFF2F2F2), borderRadius: BorderRadius.circular(4)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Text('$label $value', style: GoogleFonts.montserrat(fontSize: 10, fontWeight: FontWeight.w600)),
        const SizedBox(width: 4),
        const Icon(Icons.keyboard_arrow_down, size: 14),
      ]),
    );
  }

  Widget _paymentDetailRow(String label, String value, {bool isAction = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: GoogleFonts.montserrat(color: Colors.grey.shade700, fontSize: 13)),
        Text(value,
            style: GoogleFonts.montserrat(
                color: isAction ? const Color(0xFFFD6E87) : Colors.black,
                fontWeight: isAction ? FontWeight.bold : FontWeight.w600, fontSize: 13)),
      ],
    );
  }
}
