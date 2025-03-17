import 'package:frontend/features/login/data/services/securestorage_service.dart';
import 'package:frontend/features/register/data/models/register_request_model.dart';
import 'package:frontend/features/register/data/services/register_api_service.dart';


class RegisterRepo {
  final RegisterApiService _registerApiService;

  RegisterRepo(this._registerApiService);

  Future<void> register(RegisterRequestModel req) async {
    final response = await _registerApiService.register(req);
    await SecureStorage.saveTokens(
        accessToken: response.accessToken);
  }
}
