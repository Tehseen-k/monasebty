class SignUpBody {
  String? email;
  String? password;
  String? confirm_password;
  String? username;
  String? role;

  SignUpBody({
    this.email,
    this.password,
    this.confirm_password,
    this.username,
    this.role,
  });

  toJson() {
    return {
      'email': this.email,
      'password': this.password,
      'confirm_password': this.confirm_password,
      'username': this.username,
      'role':this.role,
      // 'fcm_token': this.fcmToken,
    };
  }
}
