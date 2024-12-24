import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiController {

  Future<List<dynamic>> fetchAllProducts() async {
    final url = Uri.parse('https://fakestoreapi.com/products');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<dynamic>> fetchAllCategory() async {
    final url = Uri.parse('https://fakestoreapi.com/products/categories');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<dynamic>> fetchProductsCategory(String category) async {
    final url = Uri.parse('https://fakestoreapi.com/products/category/$category');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load products categories');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

}