import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:monasebty/core/services/database_services.dart';
import 'package:monasebty/ui/screens/auth/otp/otp_screen.dart';

class ForgotViewModel extends ChangeNotifier {
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  final _dbService = DatabaseService();
  sendOtp(context) async {
   
    if (emailController.text.isEmpty) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Enter Your Email"),
        ),
      );
    }
     isLoading=true;
    notifyListeners();
    try {
      final isSended = await _dbService.forgotPassword(emailController.text);
      if (isSended) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Otp send to email, check your email")));
             Get.to(OTPScreen(email: emailController.text,));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error Occured, check your email")));
      }
    } catch (e) {
      print("error occured $e");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error Occured, $e")));
    }
    isLoading=false;
    notifyListeners();
  }
}
