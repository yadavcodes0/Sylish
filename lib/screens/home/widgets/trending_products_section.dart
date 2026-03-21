import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish/models/product.dart';
import 'package:stylish/services/api_service.dart';

class TrendingProductsSection extends StatelessWidget {
  const TrendingProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = screenWidth > 600 ? 180.0 : screenWidth * 0.40;
    final itemHeight = itemWidth * 1.5;

    return Column(
      children: [
        // Pink Header
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: ShapeDecoration(
            color: const Color(0xFFFD6E87),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Trending Products',
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 4),
                    Row(children: [
                      const Icon(Icons.calendar_month, color: Colors.white, size: 14),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text('Last Date 29/02/22',
                            style: GoogleFonts.montserrat(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
                            overflow: TextOverflow.ellipsis),
                      ),
                    ]),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to catalog (search tab index 3 on MainScreen)
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Text('View all',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
                    const SizedBox(width: 4),
                    const Icon(Icons.arrow_forward, color: Colors.white, size: 14),
                  ]),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Horizontal List
        FutureBuilder<List<dynamic>>(
          future: ApiService.fetchProducts(limit: 4, category: 'jewelery'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(height: itemHeight, child: const Center(child: CircularProgressIndicator()));
            } else if (snapshot.hasError) {
              return SizedBox(height: itemHeight, child: Center(child: Text('Error loading products: ${snapshot.error}')));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return SizedBox(height: itemHeight, child: const Center(child: Text('No products available')));
            }

            final products = snapshot.data!;
            return SizedBox(
              height: itemHeight,
              child: ListView.builder(
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
                      child: _buildTrendingProductCard(
                        width: itemWidth,
                        imageUrl: product.image,
                        title: product.title,
                        price: '₹${product.price.toStringAsFixed(0)}',
                        originalPrice: '₹$originalPriceInt',
                        discount: '60% off',
                      ),
                    ),
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }

  Widget _buildTrendingProductCard({
    required double width,
    required String imageUrl,
    required String title,
    required String price,
    required String originalPrice,
    required String discount,
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
                  child: const Icon(Icons.image, color: Colors.grey),
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
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: width > 130 ? 11 : 10,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        price,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          fontSize: width > 130 ? 12 : 10,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              originalPrice,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: width > 130 ? 10 : 9,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            discount,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              fontSize: width > 130 ? 10 : 9,
                              color: const Color(0xFFFD6E87),
                            ),
                          ),
                        ],
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
