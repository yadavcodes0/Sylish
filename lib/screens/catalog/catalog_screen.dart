import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish/models/product.dart';
import 'package:stylish/services/api_service.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = _fetchProducts();
  }

  Future<List<Product>> _fetchProducts() async {
    final data = await ApiService.fetchProducts(limit: 20);
    return data.map<Product>((json) => Product.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // App Bar
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.sort, color: Colors.black, size: 28),
                    SizedBox(
                      height: 38,
                      child: SvgPicture.asset("assets/icons/logo.svg"),
                    ),
                    const CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage('assets/images/user.jpg'),
                      backgroundColor: Colors.grey,
                    )
                  ],
                ),
              ),
              // Search Bar
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 1)]),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search any Product..',
                      hintStyle: GoogleFonts.montserrat(color: Colors.grey, fontSize: 13),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      suffixIcon: const Icon(Icons.mic, color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 14)),
                ),
              ),
              // Filter/Sort Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder<List<Product>>(
                    future: _productsFuture,
                    builder: (context, snapshot) {
                      final count = snapshot.hasData ? snapshot.data!.length : 0;
                      return Text('$count+ Items',
                          style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black));
                    },
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)]),
                        child: Row(children: [
                          Text('Sort', style: GoogleFonts.montserrat(fontSize: 12)),
                          const SizedBox(width: 4),
                          const Icon(Icons.swap_vert, size: 16),
                        ]),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)]),
                        child: Row(children: [
                          Text('Filter', style: GoogleFonts.montserrat(fontSize: 12)),
                          const SizedBox(width: 4),
                          const Icon(Icons.filter_alt_outlined, size: 16),
                        ]),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 16),
              // Grid View
              Expanded(
                child: FutureBuilder<List<Product>>(
                  future: _productsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator(color: Color(0xFFFD6E87)));
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    final products = snapshot.data ?? [];
                    return GridView.builder(
                      padding: const EdgeInsets.only(bottom: 16),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.65,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/product_details', arguments: product);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 1)]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                                    child: Image.network(
                                      product.image,
                                      width: double.infinity,
                                      fit: BoxFit.contain,
                                      errorBuilder: (_, __, ___) =>
                                          Container(color: Colors.grey[200], child: const Icon(Icons.image)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(product.title,
                                            style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w600, fontSize: 13, color: Colors.black),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis),
                                        Text(product.description,
                                            style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w400, fontSize: 9, color: Colors.black54),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis),
                                        Text('₹${product.price.toStringAsFixed(0)}',
                                            style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w600, fontSize: 12, color: Colors.black)),
                                        Row(children: [
                                          ...List.generate(5, (i) {
                                            if (i < product.rating.floor()) {
                                              return const Icon(Icons.star, color: Colors.amber, size: 12);
                                            } else if (i < product.rating) {
                                              return const Icon(Icons.star_half, color: Colors.amber, size: 12);
                                            }
                                            return const Icon(Icons.star_border, color: Colors.amber, size: 12);
                                          }),
                                          const SizedBox(width: 4),
                                          Text('${product.reviewCount}',
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w400, fontSize: 9, color: Colors.black54)),
                                        ])
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
