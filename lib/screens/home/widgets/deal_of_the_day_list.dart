import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish/models/product.dart';
import 'package:stylish/services/api_service.dart';

class DealOfTheDayList extends StatelessWidget {
  const DealOfTheDayList({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = screenWidth > 600 ? 200.0 : screenWidth * 0.45;
    final itemHeight = itemWidth * 1.6;

    return FutureBuilder<List<dynamic>>(
      future: ApiService.fetchProducts(limit: 3, sort: 'desc'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: itemHeight,
            child: const Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return SizedBox(
            height: itemHeight,
            child: Center(child: Text('Error loading deals: ${snapshot.error}')),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return SizedBox(
            height: itemHeight,
            child: const Center(child: Text('No deals available')),
          );
        }

        final products = snapshot.data!;
        return SizedBox(
          height: itemHeight,
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              ListView.builder(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final json = products[index];
                  final product = Product.fromJson(json);
                  int originalPriceInt = (product.price * 1.5).round();
                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/product_details', arguments: product),
                      child: _buildProductCard(
                        context,
                        width: itemWidth,
                        imageUrl: product.image,
                        title: product.title,
                        description: product.description,
                        price: '₹${product.price.toStringAsFixed(0)}',
                        originalPrice: '₹$originalPriceInt',
                        discount: '30%Off',
                        rating: product.rating,
                        reviews: product.reviewCount.toString(),
                      ),
                    ),
                  );
                },
              ),
              const Positioned(
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 16,
                  child: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blueAccent),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildProductCard(
    BuildContext context, {
    required double width,
    required String imageUrl,
    required String title,
    required String description,
    required String price,
    required String originalPrice,
    required String discount,
    required double rating,
    required String reviews,
  }) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 4,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image, color: Colors.grey),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: width > 150 ? 12 : 10,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        description,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: width > 150 ? 10 : 9,
                          color: Colors.black54,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        price,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: width > 150 ? 12 : 11,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              originalPrice,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: width > 150 ? 10 : 9,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            discount,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              fontSize: width > 150 ? 10 : 9,
                              color: const Color(0xFFFD6E87),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 10),
                      const Icon(Icons.star, color: Colors.amber, size: 10),
                      const Icon(Icons.star, color: Colors.amber, size: 10),
                      const Icon(Icons.star, color: Colors.amber, size: 10),
                      const Icon(Icons.star_half, color: Colors.amber, size: 10),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          reviews,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: width > 150 ? 10 : 9,
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
