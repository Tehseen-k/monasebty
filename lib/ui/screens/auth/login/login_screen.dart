// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:monasebty/core/constants/app_assets.dart';
import 'package:monasebty/core/constants/auth_field_decoration.dart';
import 'package:monasebty/core/constants/colors.dart';
import 'package:monasebty/core/constants/strings.dart';
import 'package:monasebty/core/other/view_state.dart';
import 'package:monasebty/ui/screens/auth/forgot_password/forgot_screen.dart';
import 'package:monasebty/ui/screens/auth/login/login_provider.dart';
import 'package:monasebty/ui/screens/auth/sign_up/sign_up_screen.dart';
import 'package:monasebty/ui/widgets/buttons/custom_button.dart';
import 'package:monasebty/ui/widgets/buttons/social_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LoginProvider(),
      child: Consumer<LoginProvider>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: ViewState.busy == model.state,
          child: Scaffold(
            ///
            /// Start Body
            ///
            body: Container(
              height: double.infinity,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0.0),
              decoration: BoxDecoration(
                  color: loginPageColor,
                  image: DecorationImage(
                      colorFilter:
                          ColorFilter.mode(starColor, BlendMode.values[5]),
                      image: AssetImage(
                        AppAssets.bg,
                      ),
                      fit: BoxFit.cover)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    70.verticalSpace,

                    ///
                    /// Logo
                    ///
                    Center(
                      child: Image.asset(
                        AppAssets.app_logo,
                        height: 225.h,
                        width: 208.w,
                      ),
                    ),
                    40.verticalSpace,

                    ///
                    /// Email address
                    ///
                    TextFormField(
                      controller: model.emailController,
                      textAlign: TextAlign.end,
                      decoration: authFieldDecoration.copyWith(
                          hintText: '...البريد الإلكتروني أو إسم المستخدم'),
                    ),
                    20.verticalSpace,

                    ///
                    /// Password
                    ///
                    TextFormField(
                      controller: model.passwordController,
                      textAlign: TextAlign.end,
                      decoration: authFieldDecoration.copyWith(
                          hintText: '...كلمة السر',
                          prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.visibility_off))),
                    ),
                    30.verticalSpace,

                    ///
                    /// Login Button
                    ///
                    CustomButton(
                      onButtonClick: () {
                        model.loginUser();
                      },
                      title: 'تسجيل الدخول',
                    ),

                    20.verticalSpace,

                    ///
                    /// Forgot Password
                    ///
                    TextButton(
                      onPressed: () {
                        Get.offAll(ForgotScreen());
                      },
                      child: Text(
                        "هل نسيت كلمة السر؟",
                        style: style14.copyWith(color: secondaryColor),
                      ),
                    ),

                    10.verticalSpace,

                    ///
                    /// Create a new account
                    ///
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.offAll(SignUpScreen());
                          },
                          child: Text(
                            "إنشاء حساب جديد",
                            style: style14.copyWith(color: secondaryColor),
                          ),
                        ),
                        Text(
                          "لا تمتلك حساب؟",
                          style: style14.copyWith(color: secondaryColor),
                        ),
                      ],
                    ),

                    20.verticalSpace,

                    ///
                    /// Google and Facebook login Accounts
                    ///
                    SocialButton(
                        onButtonClick: () {},
                        title: 'دخول بواسطة جوجل',
                        iconImg: AppAssets.google),
                    20.verticalSpace,
                    SocialButton(
                        onButtonClick: () {},
                        title: 'دخول بواسطة فيسبوك',
                        iconImg: AppAssets.fb),
                    30.verticalSpace,

                    ///
                    /// Logo Name
                    ///
                    Image.asset(
                      AppAssets.logoName,
                      scale: 2.5,
                    ),
                    20.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
