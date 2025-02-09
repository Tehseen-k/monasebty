import 'package:monasebty/core/model/response/base_resposne.dart';

class AuthResponse extends BaseResponse {
  String? accessToken;
  String? refreshToken;

  /// Default constructor
  AuthResponse(succes, {error, this.accessToken, this.refreshToken})
      : super(succes, error: error);

  /// Named Constructor
  AuthResponse.fromJson(json) : super.fromJson(json) {
    accessToken = json['accessToken'];
    refreshToken = json["refreshToken"];
  }
}
