import 'package:monasebty/core/model/app_user.dart';
import 'package:monasebty/core/model/body/login_body.dart';
import 'package:monasebty/core/model/body/sign_up_body.dart';
import 'package:monasebty/core/services/database_services.dart';
import 'package:monasebty/core/services/local_storage_services.dart';

class AuthServices {
  final _localStorageService = LocalStorageService();
  final _dbService = DatabaseService();
  AppUser? user;
  String? accessToken;

  Future<void> init() async {
    print("🔄 Initializing AuthServices...");
    accessToken = await _localStorageService.accessToken;

    print("📌 Retrieved accessToken: $accessToken");

    if (accessToken != null) {
      user = await _dbService.getUser(); // 👈 Now it works correctly
      if (user == null) {
        print("❌ User not found, need to log in.");
      } else {
        print("✅ User loaded: ${user?.name}");
      }
    } else {
      print("❌ No token found in local storage.");
    }
  }

  Future<Map<bool,String>> signUpUser(SignUpBody signUpBody) async {
    return await _dbService.createAccount(signUpBody);
  }

  Future<bool> login(LoginBody loginBody) async {
    final user = await _dbService.login(loginBody);
    if (user != null) {
      this.user = user;
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    await _localStorageService.clearUserData();
    user = null;
    accessToken = null;
    print("🚪 User logged out.");
  }

  // Optional method for refreshing token
  Future<void> refreshToken() async {
    // Your logic to refresh the token
  }
}
