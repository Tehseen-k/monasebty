import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:monasebty/core/services/database_services.dart';
import 'package:monasebty/ui/screens/auth/login/login_screen.dart';

class UpdatePasswordProvider extends ChangeNotifier {
  bool isLoading = false;
  final _dbService = DatabaseService();
    bool isvisible = true;
  bool isvisibleConfirm = true;
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  resetPassword(email, otp, context) async {
    try {
      isLoading = true;
      notifyListeners();
      final data = {
        "email": email,
        "otp": otp,
        "new_password": "${newPassword.text}",
        "confirm_password": "${confirmPassword.text}"
      };
      final isReset = await _dbService.resetPassword(data);
      if (isReset) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Password updated")));
        Get.offAll(LoginScreen());
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error Occured, try again")));
      }
    } catch (e) {
    
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error Occured, $e")));
      print("error occured : $e");
    }
    isLoading = false;
    notifyListeners();
  }

    void togglePasswordVisibility() {
    isvisible = !isvisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    isvisibleConfirm = !isvisibleConfirm;
    notifyListeners();
  }
}
