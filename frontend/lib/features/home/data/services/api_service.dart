import 'package:dio/dio.dart';
import 'package:frontend/features/home/data/models/item_model.dart';
import 'package:frontend/features/login/data/services/securestorage_service.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio);

  Future<List<Item>> getAllItems() async {
    try {
      final String? token = await SecureStorage.getAccessToken();
      print(token!);
      final response = await _dio.get('/items', data: {'token': token});

      print(response.data['Items']);

      final List<Item> data = (response.data['Items'] as List)
          .map((json) => Item.fromJson(json))
          .toList();
      print(data);
      return data;
    } on DioException catch (e) {
      print(e);
      throw Exception('Error fetching items: $e');
    }
  }
}
