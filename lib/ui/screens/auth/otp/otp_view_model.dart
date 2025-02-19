import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:monasebty/core/services/database_services.dart';
import 'package:monasebty/ui/screens/auth/update_password/update_password.dart';

class OtpViewModel extends ChangeNotifier{
  bool isLoading = false;
  final _dbService = DatabaseService();
    TextEditingController otpController = TextEditingController();
  verifyOtp(context,email) async {
   
    if (otpController.text.isEmpty) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Enter Your otp"),
        ),
      );
    }
     isLoading=true;
    notifyListeners();
    try {
      final isSended = await _dbService.verifyOtp({"email":email,"otp":otpController.text});
      if (isSended) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Otp verified")));
          Get.to(UpdatePassword(otp: otpController.text ,email: email,));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error Occured, try again")));
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