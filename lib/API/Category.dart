import 'dart:convert';
import 'package:http/http.dart' as http;
class Category{
  final String name;

  Category({required this.name});

  factory Category.fromJson(String json){
    return Category(name: json);
  }
}

Future<List<Category>> fetchCategories() async {
  final response = await http.get(Uri.parse('https://dummyjson.com/products/category-list'));
  if (response.statusCode == 200){
    List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Category.fromJson(data)).toList();
  }else{
    throw Exception("failed to load data");
  }
}