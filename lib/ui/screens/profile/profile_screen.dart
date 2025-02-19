import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:monasebty/core/constants/colors.dart';
import 'package:monasebty/core/constants/strings.dart';
import 'package:monasebty/core/services/auth_services.dart';
import 'package:get_it/get_it.dart';
import 'package:monasebty/ui/screens/auth/login/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  final _authService = GetIt.instance<AuthServices>();

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: secondaryColor, // Burgundy color
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'My Profile',
                    style: TextStyle(
                      color: thirdColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: thirdColor,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.grey[400],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _authService.user?.username ?? 'Guest',
                    style: const TextStyle(
                      color: thirdColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildMenuItem(Icons.person_outline, 'Profile', () {}),
                  _buildMenuItem(Icons.favorite_border, 'Favorite', () {}),
                  _buildMenuItem(Icons.payment, 'Payment Method', () {}),
                  _buildMenuItem(Icons.lock_outline, 'Password Manager', () {}),
                  _buildMenuItem(Icons.logout, 'Logout', () {
                    _showLogoutSheet(context);
                  }),
                  const Spacer(),
                  Center(
                    child: Image.asset(
                      'assets/images/splash.png',
                      height: 50,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/image.png',
              width: 150, // Adjust size as needed
              opacity: const AlwaysStoppedAnimation(0.5), // Makes it subtle
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListTile(
          leading: Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white10),
            padding: EdgeInsets.all(10),
            child: Icon(icon, color: thirdColor),
          ),
          title: Text(
            title,
            style: const TextStyle(
              color: thirdColor,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

void _showLogoutSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: thirdColor, // Background color
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child:
                  Text("Logout", style: style24.copyWith(color: primaryColor)),
            ),
            20.verticalSpace,
            Text("are you sure you want to log out?",
                style: style16.copyWith(
                    color: primaryColor, fontWeight: FontWeight.w400)),
            40.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close bottom sheet
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor.withOpacity(0.52)),
                  child: Text(
                    "Cancel",
                    style: style16.copyWith(color: thirdColor),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await GetIt.instance<AuthServices>().logout();
                    Navigator.pop(context); // Close bottom sheet
                    Get.offAll(LoginScreen()); // Navigate to login screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  child: Text(
                    "yes, logout",
                    style: style16.copyWith(color: whiteColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
