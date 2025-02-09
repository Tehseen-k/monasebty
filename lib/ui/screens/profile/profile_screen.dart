import 'package:flutter/material.dart';
import 'package:monasebty/core/constants/colors.dart';
import 'package:monasebty/core/services/auth_services.dart';
import 'package:get_it/get_it.dart';

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
                  _buildMenuItem(Icons.person_outline, 'Profile'),
                  _buildMenuItem(Icons.favorite_border, 'Favorite'),
                  _buildMenuItem(Icons.payment, 'Payment Method'),
                  _buildMenuItem(Icons.lock_outline, 'Password Manager'),
                  _buildMenuItem(Icons.logout, 'Logout'),
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

  Widget _buildMenuItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white10),
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
        onTap: () {
          // Handle menu item taps
        },
      ),
    );
  }
}
