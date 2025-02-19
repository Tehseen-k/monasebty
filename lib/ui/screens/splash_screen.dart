import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monasebty/core/constants/colors.dart';
import 'package:monasebty/core/services/auth_services.dart';
import 'package:monasebty/ui/locaor.dart';
import 'package:monasebty/ui/screens/auth/login/login_screen.dart';
import 'package:monasebty/ui/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final authservices = locator<AuthServices>();

  init() async {
    await authservices.init();
    print("authservices user ${authservices.user}");
    await Future.delayed(const Duration(seconds: 2));
    if (authservices.user != null) {
      // If user exists, navigate to HomeScreen
      Get.offAll(HomeScreen());
    } else {
      // If no user, navigate to LoginScreen
      Get.offAll(LoginScreen());
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Image.asset(
        "assets/images/splash_screen.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
