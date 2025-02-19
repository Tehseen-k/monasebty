import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monasebty/core/constants/colors.dart';
import 'package:monasebty/core/model/body/sign_up_body.dart';
import 'package:monasebty/core/other/view_state.dart';
import 'package:monasebty/core/services/auth_services.dart';
import 'package:monasebty/core/services/local_storage_services.dart';
import 'package:monasebty/core/view_model/base_view_model.dart';
import 'package:monasebty/ui/locaor.dart';
import 'package:monasebty/ui/screens/auth/login/login_screen.dart';

class SignUpViewModel extends BaseViewModel {
  final _authServices = locator<AuthServices>();
  final localStorageService = locator<LocalStorageService>();

  bool isChecked = false;
  bool isvisible = true;
  bool isvisibleConfirm = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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

  /// **Signup Function**
  Future<void> signUpUser() async {
    if (!isChecked) {
      Get.snackbar("خطأ", "الشروط و الأحكام غير مقبولة",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("خطأ", "كلمة المرور غير متطابقة",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    SignUpBody signUpBody = SignUpBody(
      username: nameController.text,
      email: emailController.text,
      confirm_password: confirmPasswordController.text,
      password: passwordController.text,
      role: "customer",
    );
    Map<bool, String>? response;
    try {
      setState(ViewState.busy);
      response = await _authServices.signUpUser(signUpBody);

      print("SignUpViewModel=> $response");
      if (response.keys.first == true) {
        Get.offAll(LoginScreen());
        Get.snackbar("النجاح", "تم التسجيل بنجاح",
            backgroundColor: primaryColor, colorText: Colors.white);
      } else {
        Get.snackbar("خطأ", "بالفعل تسجيل المستخدم",
            backgroundColor: primaryColor, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar("خطأ", "بالفعل تسجيل المستخدم",
          backgroundColor: primaryColor, colorText: Colors.white);
    }
    setState(ViewState.idle);
  }
}
