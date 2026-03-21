import 'package:flutter/material.dart';
import 'package:stylish/models/product.dart';

class WishlistProvider extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => List.unmodifiable(_items);

  int get itemCount => _items.length;

  bool isWishlisted(int productId) {
    return _items.any((p) => p.id == productId);
  }

  void toggleWishlist(Product product) {
    final index = _items.indexWhere((p) => p.id == product.id);
    if (index >= 0) {
      _items.removeAt(index);
    } else {
      _items.add(product);
    }
    notifyListeners();
  }

  void removeFromWishlist(int productId) {
    _items.removeWhere((p) => p.id == productId);
    notifyListeners();
  }
}
