import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monasebty/core/constants/colors.dart';
import 'package:monasebty/core/model/body/login_body.dart';
import 'package:monasebty/core/other/view_state.dart';
import 'package:monasebty/core/services/auth_services.dart';
import 'package:monasebty/core/services/local_storage_services.dart';
import 'package:monasebty/core/view_model/base_view_model.dart';
import 'package:monasebty/ui/locaor.dart';
import 'package:monasebty/ui/screens/home/home_screen.dart';

class LoginProvider extends BaseViewModel {
  bool isChecked = false;
  bool isvisible = true;
  bool isvisibleConfirm = true;
  final _authServices = locator<AuthServices>();
  final localStorageService = locator<LocalStorageService>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void toggleCheckbox() {
    isChecked = !isChecked;
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

  Future<void> loginUser() async {
    LoginBody loginBody = LoginBody(
      email: emailController.text,
      password: passwordController.text,
    );
    try {
      setState(ViewState.busy);
      final response = await _authServices.login(loginBody);

      print("SignUpViewModel=> $response");
      if (response == true) {
        Get.offAll(HomeScreen());
        Get.snackbar("النجاح", "تسجيل الدخول بنجاح",
            backgroundColor: primaryColor, colorText: Colors.white);
      } else {
        Get.snackbar("خطأ",
            "البريد الإلكتروني وكلمة المرور خاطئان، يرجى التحقق مرة أخرى",
            backgroundColor: primaryColor, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("خطأ", "${e.toString()}",
          backgroundColor: primaryColor, colorText: Colors.white);
    }
    setState(ViewState.idle);
  }
}
