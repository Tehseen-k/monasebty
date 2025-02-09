// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:monasebty/core/constants/app_assets.dart';
import 'package:monasebty/core/constants/auth_field_decoration.dart';
import 'package:monasebty/core/constants/colors.dart';
import 'package:monasebty/ui/screens/auth/login/login_provider.dart';
import 'package:monasebty/ui/screens/home/home_screen.dart';
import 'package:monasebty/ui/widgets/buttons/custom_button.dart';
import 'package:provider/provider.dart';

class UpdatePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LoginProvider(),
      child: Consumer<LoginProvider>(
        builder: (context, model, child) => Scaffold(
          ///
          /// Start Body
          ///
          body: Container(
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0.0),
            decoration: BoxDecoration(
                color: sinUpPageColor,
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        starColor.withOpacity(0.15), BlendMode.values[10]),
                    image: AssetImage(
                      AppAssets.bg,
                    ),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  70.verticalSpace,

                  ///
                  /// Logo
                  ///
                  Center(
                    child: Image.asset(
                      AppAssets.app_logo,
                      height: 253.h,
                      width: 234.w,
                    ),
                  ),
                  40.verticalSpace,

                  ///
                  /// Password
                  ///
                  TextFormField(
                    obscureText: model.isvisible,
                    textAlign: TextAlign.end,
                    decoration: authFieldDecoration.copyWith(
                        hintText: '...كلمة السر',
                        prefixIcon: IconButton(
                            onPressed: () {
                              model.togglePasswordVisibility();
                            },
                            icon: model.isvisible
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility))),
                  ),
                  20.verticalSpace,

                  ///
                  /// Confirm Password
                  ///
                  TextFormField(
                    obscureText: model.isvisibleConfirm,
                    textAlign: TextAlign.end,
                    decoration: authFieldDecoration.copyWith(
                        hintText: '...تأكيد كلمة السر',
                        prefixIcon: IconButton(
                            onPressed: () {
                              model.toggleConfirmPasswordVisibility();
                            },
                            icon: model.isvisibleConfirm
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility))),
                  ),

                  30.verticalSpace,

                  ///
                  ///  Button
                  ///
                  CustomButton(
                    onButtonClick: () {
                      Get.offAll(HomeScreen());
                    },
                    title: 'تحقق من الرمز',
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            height: 90.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: sinUpPageColor,
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        starColor.withOpacity(0.15), BlendMode.values[10]),
                    image: AssetImage(
                      AppAssets.bg,
                    ),
                    fit: BoxFit.cover)),
            child: Image.asset(
              AppAssets.logoName,
              scale: 2.5,
            ),
          ),
        ),
      ),
    );
  }
}
