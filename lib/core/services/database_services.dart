import 'package:monasebty/core/constants/api_end_points.dart';
import 'package:monasebty/core/model/app_user.dart';
import 'package:monasebty/core/model/body/login_body.dart';
import 'package:monasebty/core/model/body/sign_up_body.dart';
import 'package:monasebty/core/model/venue.dart';
import 'package:monasebty/core/services/api_services.dart';
import 'package:monasebty/core/services/local_storage_services.dart';

class DatabaseService {
  final ApiServices _apiServices = ApiServices();
  final _localStorageService = LocalStorageService();

  /// Sign Up
  Future<Map<bool,String>> createAccount(SignUpBody signUpBody) async {
    final response = await _apiServices.post(
      url: '${EndPoints.baseUrl + EndPoints.signup}',
      isRegister: true,
      data: signUpBody.toJson(),
    );

    return {response.data["message"] == "register successfully":response.data["message"]};
  }

  /// Login
  Future<AppUser?> login(LoginBody loginBody) async {
    final response = await _apiServices.post(
      url: '${EndPoints.baseUrl + EndPoints.login}',
      data: loginBody.toJson(),
      isRegister: true,
    );

    if (response.success) {
      final user = AppUser.fromJson(response.data['user']);
      final accessToken = response.data['access'];
      final refreshToken = response.data['refresh'];

      // Save Tokens & User ID
      await _localStorageService.setUserData(
        id: user.id.toString(),
        accessToken: accessToken,
        refreshToken: refreshToken,
      );

      print("✅ User & Tokens saved in local storage: ${user.id}");
      return user;
    } else {
      print("❌ Login failed!");
      return null;
    }
  }

  /// Get User Data
  Future<AppUser?> getUser() async {
    final userId = await _localStorageService.userId;
    // final accessToken = await _localStorageService.accessToken;

    if (userId == null) {
      print("❌ No user found in local storage.");
      return null;
    }

    print("Fetching user data for ID: $userId");

    // Pass the token in the Authorization header
    final response = await _apiServices.get(
      url: '${EndPoints.baseUrl}${EndPoints.getUser}/${userId}',
      // params: {
      //   'user_id': '$userId', // Include the token in the header
      // },
    );

    if (response.success) {
      final user = AppUser.fromJson(response.data);
      print("✅ User Retrieved: ${user.name}");
      return user;
    } else {
      print("❌ Failed to fetch user data.");
      return null;
    }
  }

  /// Get All Venues
  Future<List<Venue>?> getVenues() async {
    final response = await _apiServices.get(
      url: '${EndPoints.baseUrl}${EndPoints.getAllVenues}/',
    );

    if (response.success) {
      final venues = (response.data as List)
          .map((venue) => Venue.fromJson(venue))
          .toList();
      print("✅ venues Retrieved: ${venues.length}");
      return venues;
    } else {
      print("❌ Failed to fetch venues data.");
      return null;
    }
  }

  Future<bool> forgotPassword(email) async {
    final response = await _apiServices.post(
        url: '${EndPoints.baseUrl}${EndPoints.forgotPassword}',
        isRegister: true,
        data: {"email": email});

    if (response.success) {
      // final venues = (response.data as List)
      //     .map((venue) => Venue.fromJson(venue))
      //     .toList();
      print("✅ forget password: ${response.data}");
      return true;
    } else {
      print("❌ Failed to fetch venues data.");
      return false;
    }
  }
   Future<bool> verifyOtp(data) async {
    final response = await _apiServices.post(
        url: '${EndPoints.baseUrl}${EndPoints.verifyOtp}',
        isRegister: true,
        data: data);

    if (response.success) {
      // final venues = (response.data as List)
      //     .map((venue) => Venue.fromJson(venue))
      //     .toList();
      print("✅ Successfully verified: ${response.data}");
      return true;
    } else {
      print("❌ Failed to verify.");
      return false;
    }
  }

  Future<bool> resetPassword(data) async {
    final response = await _apiServices.post(
        url: '${EndPoints.baseUrl}${EndPoints.resetPassword}', data: data,isRegister: true);

    if (response.success) {
      print("✅ reset password: ${response.data}");
      return true;
    } else {
      print("❌ Failed to reset password.");
      return false;
    }
  }

  Future<bool> newBooking(data) async {
    final response = await _apiServices.post(
        url: '${EndPoints.baseUrl}${EndPoints.createBoking}', data: data);

    if (response.success) {
      print("✅ booking confirm ${response.data}");
      return true;
    } else {
      print("❌ Failed to make booking.");
      return false;
    }
  }

  /// Logout User (Clear Data)
  Future<void> logout() async {
    await _localStorageService.clearUserData();
    print("✅ User logged out!");
  }
}
