import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  final String baseUrl = 'https://fakestoreapi.com/products';

  Future<List<dynamic>> fetchProducts({int limit = 10, int skip = 0}) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl?_limit=$limit&_page=${(skip ~/ limit) + 1}'));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }
}
