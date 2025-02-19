import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monasebty/core/constants/colors.dart';
import 'package:monasebty/core/services/database_services.dart';
import 'package:monasebty/ui/screens/auth/otp/otp_screen.dart';

class ForgotViewModel extends ChangeNotifier {
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  final _dbService = DatabaseService();
  sendOtp(context) async {
    if (emailController.text.isEmpty) {
      return Get.snackbar("خطاء", "الرجاء إدخال البريد الإلكتروني الخاص بك",
          backgroundColor: primaryColor, colorText: Colors.white);
    }
    isLoading = true;
    notifyListeners();
    try {
      final isSended = await _dbService.forgotPassword(emailController.text);
      if (isSended) {
        Get.snackbar("النجاح",
            "OTP إرسال إلى البريد الإلكتروني، والتحقق من البريد الإلكتروني الخاص بك",
            backgroundColor: primaryColor, colorText: Colors.white);

        Get.to(OTPScreen(
          email: emailController.text,
        ));
      } else {
        Get.snackbar("خطأ", "تحقق من بريدك الإلكتروني",
            backgroundColor: primaryColor, colorText: Colors.white);
      }
    } catch (e) {
      print("error occured $e");
      Get.snackbar("خطأ", "حدث خطأ, $e",
          backgroundColor: primaryColor, colorText: Colors.white);
    }
    isLoading = false;
    notifyListeners();
  }
}
