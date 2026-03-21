class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String image;
  final String category;
  final double rating;
  final int reviewCount;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
    this.rating = 0.0,
    this.reviewCount = 0,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      image: json['image'] ?? '',
      category: json['category'] ?? '',
      rating: (json['rating']?['rate'] as num?)?.toDouble() ?? 0.0,
      reviewCount: json['rating']?['count'] ?? 0,
    );
  }

  /// Create a Product from local/hardcoded data (no API rating structure)
  factory Product.fromLocal({
    required int id,
    required String title,
    required String description,
    required double price,
    required String image,
    String category = '',
    double rating = 4.5,
    int reviewCount = 0,
  }) {
    return Product(
      id: id,
      title: title,
      description: description,
      price: price,
      image: image,
      category: category,
      rating: rating,
      reviewCount: reviewCount,
    );
  }
}
