import 'package:dio/dio.dart';
import 'package:frontend/features/home/data/models/item_model.dart';
import '../models/item.dart'; // Ensure this points to your Item model

class ApiService {
  late Dio _dio;

  ApiService() {
    _dio = Dio(BaseOptions(
      baseUrl: 'http://localhost:3000', 
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ));
  }

  // Fetch all items
  Future<List<Item>> getAllItems() async {
    try {
      final response = await _dio.get('/items');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => Item.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load items');
      }
    } catch (e) {
      throw Exception('Error fetching items: $e');
    }
  }

  // Fetch shopping cart items
  Future<List<Item>> getShoppingCartItems() async {
    try {
      final response = await _dio.get('/cart');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => Item.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load shopping cart items');
      }
    } catch (e) {
      throw Exception('Error fetching shopping cart items: $e');
    }
  }
}
