import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static SharedPreferences? _preferences;

  /// Keys
  static const String userIdKey = 'userId';
  static const String accessTokenKey = 'accessToken';
  static const String refreshTokenKey = 'refreshToken';

  /// Initialize SharedPreferences
  Future<void> _ensureInitialized() async {
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
  }

  /// Save User Data
  Future<void> setUserData({
    required String id,
    required String accessToken,
    required String refreshToken,
  }) async {
    await _ensureInitialized();
    await _preferences!.setString(userIdKey, id);
    await _preferences!.setString(accessTokenKey, accessToken);
    await _preferences!.setString(refreshTokenKey, refreshToken);
    print("(TRACE) Saved userId: $id, accessToken & refreshToken");
  }

  /// Get User ID
  Future<String?> get userId async {
    await _ensureInitialized();
    return _preferences?.getString(userIdKey);
  }

  /// Get Access Token
  Future<String?> get accessToken async {
    await _ensureInitialized();
    return _preferences?.getString(accessTokenKey);
  }

  /// Get Refresh Token
  Future<String?> get refreshToken async {
    await _ensureInitialized();
    return _preferences?.getString(refreshTokenKey);
  }

  /// Clear User Data (Logout)
  Future<void> clearUserData() async {
    await _ensureInitialized();
    await _preferences!.remove(userIdKey);
    await _preferences!.remove(accessTokenKey);
    await _preferences!.remove(refreshTokenKey);
    print("(TRACE) Cleared all user data.");
  }
}
