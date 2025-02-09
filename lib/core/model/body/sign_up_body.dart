class SignUpBody {
  String? email;
  String? password;
  String? confirm_password;
  String? username;

  SignUpBody({
    this.email,
    this.password,
    this.confirm_password,
    this.username,
  });

  toJson() {
    return {
      'email': this.email,
      'password': this.password,
      'confirm_password': this.confirm_password,
      'username': this.username,
      // 'fcm_token': this.fcmToken,
    };
  }
}
