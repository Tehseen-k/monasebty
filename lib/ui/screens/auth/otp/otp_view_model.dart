import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:monasebty/core/constants/colors.dart';
import 'package:monasebty/core/services/database_services.dart';
import 'package:monasebty/ui/screens/auth/update_password/update_password.dart';

class OtpViewModel extends ChangeNotifier {
  bool isLoading = false;
  final _dbService = DatabaseService();
  TextEditingController otpController = TextEditingController();
  verifyOtp(context, email) async {
    if (otpController.text.isEmpty) {
      return Get.snackbar("خطاء", "أدخل كلمة المرور الخاصة بك",
          backgroundColor: primaryColor, colorText: Colors.white);
    }
    isLoading = true;
    notifyListeners();
    try {
      final isSended = await _dbService
          .verifyOtp({"email": email, "otp": otpController.text});
      if (isSended) {
        Get.snackbar("النجاح", "تم التحقق من OTP",
            backgroundColor: primaryColor, colorText: Colors.white);
        Get.to(UpdatePassword(
          otp: otpController.text,
          email: email,
        ));
      } else {
        Get.snackbar("حدث خطأ", "حاول ثانية",
            backgroundColor: primaryColor, colorText: Colors.white);
      }
    } catch (e) {
      print("error occured $e");

      Get.snackbar("حدث خطأ", "$e",
          backgroundColor: primaryColor, colorText: Colors.white);
    }
    isLoading = false;
    notifyListeners();
  }
}
