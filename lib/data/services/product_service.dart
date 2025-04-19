// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:meubel/presentation/home/models/product_model.dart';

// class ProductService {
//   final String baseUrl = 'http://10.0.2.2:8000/api';

//   Future<List<ProductModel>> getAllProducts() async {
//     final response = await http.get(Uri.parse('$baseUrl/products'));

//     if (response.statusCode == 200) {
//       final List<dynamic> jsonList = jsonDecode(response.body)['data'];
//       return jsonList.map((json) => ProductModel.fromJson(json)).toList();
//     } else {
//       throw Exception('Gagal mengambil produk: ${response.body}');
//     }
//   }

//   Future<ProductModel> getProductById(int id) async {
//     final response = await http.get(Uri.parse('$baseUrl/products/$id'));

//     if (response.statusCode == 200) {
//       final json = jsonDecode(response.body)['data'];
//       return ProductModel.fromJson(json);
//     } else {
//       throw Exception('Gagal mengambil detail produk: ${response.body}');
//     }
//   }

//   Future<ProductModel> addProduct(ProductModel product) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/products'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(product.toJson()),
//     );

//     if (response.statusCode == 201 || response.statusCode == 200) {
//       return ProductModel.fromJson(jsonDecode(response.body)['data']);
//     } else {
//       throw Exception('Gagal menambah produk: ${response.body}');
//     }
//   }

//   Future<ProductModel> updateProduct(ProductModel product) async {
//     final response = await http.put(
//       Uri.parse('$baseUrl/products/${product.id}'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(product.toJson()),
//     );

//     if (response.statusCode == 200) {
//       return ProductModel.fromJson(jsonDecode(response.body)['data']);
//     } else {
//       throw Exception('Gagal update produk: ${response.body}');
//     }
//   }

//   Future<void> deleteProduct(int id) async {
//     final response = await http.delete(Uri.parse('$baseUrl/products/$id'));

//     if (response.statusCode != 200) {
//       throw Exception('Gagal menghapus produk: ${response.body}');
//     }
//   }
// }
