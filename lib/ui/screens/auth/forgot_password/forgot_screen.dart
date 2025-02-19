// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:monasebty/core/constants/app_assets.dart';
import 'package:monasebty/core/constants/auth_field_decoration.dart';
import 'package:monasebty/core/constants/colors.dart';
import 'package:monasebty/core/constants/strings.dart';
import 'package:monasebty/ui/screens/auth/forgot_password/forgot_view_model.dart';
import 'package:monasebty/ui/screens/auth/login/login_provider.dart';
import 'package:monasebty/ui/screens/auth/otp/otp_screen.dart';
import 'package:monasebty/ui/widgets/buttons/custom_button.dart';
import 'package:provider/provider.dart';

class ForgotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ForgotViewModel(),
      child: Consumer<ForgotViewModel>(
        builder: (context, value, child) => ModalProgressHUD(
          inAsyncCall: value.isLoading,
          progressIndicator: CircularProgressIndicator(color: primaryColor,),
          child: Scaffold(
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
                    /// Email address
                    ///
                    TextFormField(
                      controller: value.emailController,
                      textAlign: TextAlign.end,
                      decoration: authFieldDecoration.copyWith(
                          hintText: '...البريد الإلكتروني أو إسم المستخدم'),
                    ),
          
                    30.verticalSpace,
          
                    ///
                    /// Login Button
                    ///
                    CustomButton(
                      onButtonClick: () {
                        value.sendOtp(context);
                       
                      },
                      title: 'إسترجاع كلمة السر',
                    ),
                    20.verticalSpace,
                    Text(
                      'رجوع إلى تسجيل الدخول',
                      style: style14.copyWith(color: secondaryColor),
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
      ),
    );
  }
}
