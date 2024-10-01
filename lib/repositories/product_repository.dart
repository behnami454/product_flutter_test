import 'package:product_app/models/product_model.dart';
import 'package:product_app/services/api_service.dart';

class ProductRepository {
  final APIService apiService;

  ProductRepository({required this.apiService});

  Future<List<Product>> fetchProducts({int limit = 10, int skip = 0}) async {
    try {
      List<dynamic> productList = await apiService.fetchProducts(limit: limit, skip: skip);
      return productList.map((json) => Product.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }
}
