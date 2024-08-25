import 'package:flutter_project/API/ProductsModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class FetchApi {

  Future<List<ProductsModel>> fetchProducts(String categoryName) async {
    try {
      final response = await http.get(
          Uri.parse('https://dummyjson.com/products/category/$categoryName'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<dynamic> productsJson = data['products'] ?? [];
        return productsJson.map((json) => ProductsModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load products');
    }
  }
}

  /*
  Future<List<ProductsModel>> fetchProductsByCategory(String category) async {
    final List<ProductsModel> products = await fetchProducts();
    return products.where((product) => product.category == category).toList();
  }
}

   */
