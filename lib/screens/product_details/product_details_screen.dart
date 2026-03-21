import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stylish/models/product.dart';
import 'package:stylish/providers/cart_provider.dart';
import 'package:stylish/providers/wishlist_provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _selectedSize = 7;

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as Product?;

    if (product == null) {
      return Scaffold(
        appBar: AppBar(leading: const BackButton()),
        body: const Center(child: Text('Product not found')),
      );
    }

    final cart = Provider.of<CartProvider>(context);
    final wishlist = Provider.of<WishlistProvider>(context);
    final isWishlisted = wishlist.isWishlisted(product.id);
    final isInCart = cart.isInCart(product.id);
    final discountedPrice = product.price;
    final originalPrice = (product.price * 1.5).round();
    final discountPercent = (((originalPrice - discountedPrice) / originalPrice) * 100).round();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isWishlisted ? Icons.favorite : Icons.favorite_border,
              color: isWishlisted ? const Color(0xFFFD6E87) : Colors.black,
            ),
            onPressed: () => wishlist.toggleWishlist(product),
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(color: Color(0xFFF2F2F2), shape: BoxShape.circle),
                  child: const Icon(Icons.shopping_cart_outlined, color: Colors.black, size: 20),
                ),
                onPressed: () => Navigator.pushNamed(context, '/cart'),
              ),
              if (cart.itemCount > 0)
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(color: Color(0xFFFD6E87), shape: BoxShape.circle),
                    child: Text('${cart.itemCount}',
                        style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 8)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  product.image,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => Container(
                    height: 250,
                    color: Colors.grey[200],
                    child: const Icon(Icons.image, size: 60),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Size selector
              Text('Size: ${_selectedSize}UK',
                  style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),
              const SizedBox(height: 8),
              Row(
                children: [6, 7, 8, 9, 10].map((size) {
                  final isSelected = size == _selectedSize;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedSize = size),
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFFD6E87) : Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: isSelected ? Colors.transparent : Colors.grey.shade300)),
                      child: Text('$size UK',
                          style: GoogleFonts.montserrat(
                              color: isSelected ? Colors.white : Colors.black87, fontWeight: FontWeight.w500)),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              // Product Info
              Text(product.title,
                  style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
              Text(product.category.toUpperCase(),
                  style: GoogleFonts.montserrat(fontSize: 13, color: Colors.black54)),
              const SizedBox(height: 8),
              Row(children: [
                ...List.generate(5, (i) {
                  if (i < product.rating.floor()) return const Icon(Icons.star, color: Colors.amber, size: 16);
                  if (i < product.rating) return const Icon(Icons.star_half, color: Colors.amber, size: 16);
                  return const Icon(Icons.star_border, color: Colors.amber, size: 16);
                }),
                const SizedBox(width: 8),
                Text('${product.reviewCount}', style: GoogleFonts.montserrat(fontSize: 12, color: Colors.black54)),
              ]),
              const SizedBox(height: 12),
              Row(children: [
                Text('₹$originalPrice',
                    style: GoogleFonts.montserrat(
                        fontSize: 14, color: Colors.grey, decoration: TextDecoration.lineThrough)),
                const SizedBox(width: 8),
                Text('₹${discountedPrice.toStringAsFixed(0)}',
                    style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                const SizedBox(width: 8),
                Text('$discountPercent% Off',
                    style: GoogleFonts.montserrat(
                        fontSize: 14, fontWeight: FontWeight.w600, color: const Color(0xFFFD6E87))),
              ]),
              const SizedBox(height: 16),
              Text('Product Details',
                  style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
              const SizedBox(height: 4),
              Text(product.description, style: GoogleFonts.montserrat(fontSize: 12, color: Colors.black87)),
              const SizedBox(height: 16),
              Row(children: [
                Expanded(
                    child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.location_on_outlined, size: 16, color: Colors.black),
                        label: Text('Nearest Store',
                            style: GoogleFonts.montserrat(fontSize: 10, color: Colors.black)))),
                const SizedBox(width: 8),
                Expanded(
                    child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.lock_outline, size: 16, color: Colors.black),
                        label: Text('VIP', style: GoogleFonts.montserrat(fontSize: 10, color: Colors.black)))),
                const SizedBox(width: 8),
                Expanded(
                    child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.restart_alt, size: 16, color: Colors.black),
                        label: Text('Return policy',
                            style: GoogleFonts.montserrat(fontSize: 10, color: Colors.black)))),
              ]),
              const SizedBox(height: 16),
              // Action Buttons
              Row(children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: isInCart ? Colors.grey : const Color(0xFF3F8CFF),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                    onPressed: () {
                      if (!isInCart) {
                        cart.addToCart(product, size: '$_selectedSize UK');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('${product.title} added to cart!'),
                              backgroundColor: Colors.green,
                              duration: const Duration(seconds: 1)),
                        );
                      }
                      Navigator.pushNamed(context, '/cart');
                    },
                    icon: Icon(isInCart ? Icons.shopping_cart : Icons.shopping_cart_outlined, color: Colors.white),
                    label: Text(isInCart ? 'In Cart' : 'Go to cart',
                        style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w600)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF31D183),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                    onPressed: () {
                      if (!isInCart) {
                        cart.addToCart(product, size: '$_selectedSize UK');
                      }
                      Navigator.pushNamed(context, '/cart');
                    },
                    icon: const Icon(Icons.touch_app_outlined, color: Colors.white),
                    label: Text('Buy Now',
                        style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w600)),
                  ),
                ),
              ]),
              const SizedBox(height: 16),
              // Delivery Box
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration:
                    BoxDecoration(color: const Color(0xFFFFD3DA), borderRadius: BorderRadius.circular(8)),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Delivery in',
                      style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black)),
                  Text('1 within Hour',
                      style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
                ]),
              ),
              const SizedBox(height: 32)
            ],
          ),
        ),
      ),
    );
  }
}
