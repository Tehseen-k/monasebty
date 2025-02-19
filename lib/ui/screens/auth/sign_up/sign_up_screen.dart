import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:monasebty/core/constants/app_assets.dart';
import 'package:monasebty/core/constants/auth_field_decoration.dart';
import 'package:monasebty/core/constants/colors.dart';
import 'package:monasebty/core/constants/strings.dart';
import 'package:monasebty/core/other/view_state.dart';
import 'package:monasebty/ui/screens/auth/login/login_screen.dart';
import 'package:monasebty/ui/widgets/buttons/custom_button.dart';
import 'package:monasebty/ui/widgets/buttons/social_button.dart';
import 'package:monasebty/ui/screens/auth/sign_up/sign_up_view_model.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  // Create a GlobalKey for the form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SignUpViewModel(),
      child: Consumer<SignUpViewModel>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            body: Container(
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    70.verticalSpace,
                    Center(
                      child: Image.asset(
                        AppAssets.app_logo,
                        height: 100.h,
                        width: 92.w,
                      ),
                    ),
                    40.verticalSpace,
                    // Form to wrap all fields
                    Form(
                      key: _formKey, // Attach the form key to the Form widget
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Name Field
                          TextFormField(
                            controller: model.nameController,
                            textAlign: TextAlign.end,
                            decoration: authFieldDecoration.copyWith(
                                hintText: '...إسم المستخد'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'الرجاء إدخال اسم المستخدم';
                              }
                              return null;
                            },
                          ),
                          20.verticalSpace,
                          // Email Field
                          TextFormField(
                            controller: model.emailController,
                            textAlign: TextAlign.end,
                            decoration: authFieldDecoration.copyWith(
                                hintText:
                                    '...البريد الإلكتروني أو إسم المستخدم'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'الرجاء إدخال البريد الإلكتروني';
                              } else if (!GetUtils.isEmail(value)) {
                                return 'الرجاء إدخال بريد إلكتروني صالح';
                              }
                              return null;
                            },
                          ),
                          20.verticalSpace,
                          // Password Field
                          TextFormField(
                            controller: model.passwordController,
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'الرجاء إدخال كلمة المرور';
                              }
                              return null;
                            },
                          ),
                          20.verticalSpace,
                          // Confirm Password Field
                          TextFormField(
                            controller: model.confirmPasswordController,
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'الرجاء إدخال تأكيد كلمة المرور';
                              } else if (value !=
                                  model.passwordController.text) {
                                return 'كلمة المرور غير متطابقة';
                              }
                              return null;
                            },
                          ),
                          10.verticalSpace,
                          // Checkbox for Terms and Conditions
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "من خلال إنشاء الحساب، فإنك توافق على الشروط  و الأحكام الخاصة بالتطبيق",
                                textAlign: TextAlign.end,
                                style: style14.copyWith(color: secondaryColor),
                              ),
                              10.horizontalSpace,
                              GestureDetector(
                                onTap: () {
                                  model.toggleCheckbox();
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.r),
                                    color: model.isChecked
                                        ? secondaryColor
                                        : whiteColor,
                                    border: Border.all(
                                      color: secondaryColor,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: model.isChecked
                                      ? Icon(
                                          Icons.check,
                                          size: 15.sp,
                                          color: whiteColor,
                                        )
                                      : null,
                                ),
                              ),
                            ],
                          ),
                          30.verticalSpace,
                          // Sign Up Button
                          CustomButton(
                            onButtonClick: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                model.signUpUser();
                              }
                            },
                            title: 'إنشاء حساب جديد',
                          ),
                        ],
                      ),
                    ),
                    10.verticalSpace,
                    // Login Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.offAll(LoginScreen());
                          },
                          child: Text(
                            "تسجيل الدخول",
                            style: style14.copyWith(color: secondaryColor),
                          ),
                        ),
                        Text(
                          "لديك حساب بالفعل؟ ",
                          style: style14.copyWith(color: secondaryColor),
                        ),
                      ],
                    ),
                    20.verticalSpace,
                    // Google and Facebook login buttons
                    SocialButton(
                      onButtonClick: () {},
                      title: 'دخول بواسطة جوجل',
                      iconImg: AppAssets.google,
                    ),
                    20.verticalSpace,
                    SocialButton(
                      onButtonClick: () {},
                      title: 'دخول بواسطة فيسبوك',
                      iconImg: AppAssets.fb,
                    ),
                    30.verticalSpace,
                    // Logo Name
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
