import 'package:dio/dio.dart';
import 'package:frontend/features/home/data/models/item_model.dart';
import 'package:frontend/features/login/data/services/securestorage_service.dart';

class ApiService {
  late Dio _dio;

  ApiService() {
    _dio = Dio(BaseOptions(
      baseUrl: 'http://localhost:8000',
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ));
  }

  Future<List<Item>> getAllItems() async {
    try {
      final String? token = await SecureStorage.getAccessToken();
      final response = await _dio.get('/items', data: {'token': token});

      List<dynamic> data = response.data;
      print(data);
      return data.map((json) => Item.fromJson(json)).toList();
    } on DioException catch (e) {
      print(e);
      throw Exception('Error fetching items: $e');
    }
  }
}
