import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monasebty/core/constants/colors.dart';
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
        Get.snackbar("النجاح", "تم تحديث كلمة المرور",
            backgroundColor: primaryColor, colorText: Colors.white);
        Get.offAll(LoginScreen());
      } else {
        Get.snackbar("خطأ", "حاول ثانية",
            backgroundColor: primaryColor, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("خطأ", "$e",
          backgroundColor: primaryColor, colorText: Colors.white);
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
