import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com/products';

  static Future<List<dynamic>> fetchProducts({int limit = 5, String sort = 'asc', String? category}) async {
    try {
      String url = baseUrl;
      if (category != null) {
        url += '/category/$category';
      }
      url += '?limit=$limit&sort=$sort';
      
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Exception while fetching products: $e');
    }
  }
}
