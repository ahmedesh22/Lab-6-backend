import 'package:dio/dio.dart';
import 'package:frontend/features/register/data/models/register_request_model.dart';
import 'package:frontend/features/register/data/models/register_response_model.dart';

class RegisterApiService {
  final Dio _dio;

  RegisterApiService(this._dio);

  Future<RegisterResponse> register(
      RegisterRequestModel registerRequestModel) async {
    try {
      final response = await _dio.post(
        '/users/signup',
        data: registerRequestModel.toJson(),
      );
      print(response.data);
      return RegisterResponse.fromJson(response.data);
    } on DioException catch (e) {
      print(e.response?.statusCode);
      throw Exception(_handleDioError(e));
    }
  }

  String _handleDioError(DioException e) {
    if (e.response != null) {
      if (e.response?.statusCode == 400) {
        return e.response?.data['error'] ?? 'Invalid data';
      } else if (e.response?.statusCode == 409) {
        return 'User already exists';
      } else if (e.response?.statusCode == 500) {
        return 'Internal Server Error';
      } else {
        return 'Error: ${e.response?.statusMessage?.toString()}';
      }
    } else {
      return 'Network error: ${e.message}';
    }
  }
}
