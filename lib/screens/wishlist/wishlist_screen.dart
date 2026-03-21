import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stylish/providers/wishlist_provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlist = Provider.of<WishlistProvider>(context);
    final items = wishlist.items;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        title: Text('Wishlist', style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: items.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.favorite_border, size: 80, color: Colors.grey),
                  const SizedBox(height: 16),
                  Text('Your wishlist is empty', style: GoogleFonts.montserrat(fontSize: 18, color: Colors.grey)),
                  const SizedBox(height: 8),
                  Text('Tap the ♡ on any product to add it here',
                      style: GoogleFonts.montserrat(fontSize: 13, color: Colors.grey.shade500)),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final product = items[index];
                return Dismissible(
                  key: ValueKey(product.id),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) => wishlist.removeFromWishlist(product.id),
                  background: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(color: Colors.red.shade100, borderRadius: BorderRadius.circular(12)),
                    child: const Icon(Icons.delete, color: Colors.red),
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/product_details', arguments: product),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(12),
                          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 1)]),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
                            child: Image.network(product.image, width: 100, height: 110, fit: BoxFit.contain,
                                errorBuilder: (_, __, ___) => Container(width: 100, height: 110, color: Colors.grey[200], child: const Icon(Icons.image))),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.title, style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 14),
                                      maxLines: 1, overflow: TextOverflow.ellipsis),
                                  const SizedBox(height: 4),
                                  Text(product.category, style: GoogleFonts.montserrat(fontSize: 11, color: Colors.black54)),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('₹${product.price.toStringAsFixed(0)}',
                                          style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold)),
                                      Row(children: [
                                        const Icon(Icons.star, color: Colors.amber, size: 14),
                                        const SizedBox(width: 2),
                                        Text('${product.rating}', style: GoogleFonts.montserrat(fontSize: 12, color: Colors.black54)),
                                      ]),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.favorite, color: Color(0xFFFD6E87)),
                            onPressed: () => wishlist.removeFromWishlist(product.id),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
