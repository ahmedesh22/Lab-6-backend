import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final _storage = FlutterSecureStorage();

  
  static const _accessTokenKey = 'ACCESS_TOKEN';

  static Future<void> saveTokens({
    required String accessToken,
  }) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
  }

  static Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }


  static Future<void> clearTokens() async {
    await _storage.delete(key: _accessTokenKey);
  }
}
