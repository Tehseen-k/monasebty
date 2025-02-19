// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:monasebty/core/constants/app_assets.dart';
import 'package:monasebty/core/constants/auth_field_decoration.dart';
import 'package:monasebty/core/constants/colors.dart';
import 'package:monasebty/ui/screens/auth/otp/otp_view_model.dart';
import 'package:monasebty/ui/widgets/buttons/custom_button.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatelessWidget {
  String email;
  OTPScreen({required this.email});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => OtpViewModel(),
      child: Consumer<OtpViewModel>(
        builder: (context, value, child) => ModalProgressHUD(
          inAsyncCall: value.isLoading,
          progressIndicator: CircularProgressIndicator(
            color: primaryColor,
          ),
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
                    /// Otp
                    ///
                    TextFormField(
                      controller: value.otpController,
                      textAlign: TextAlign.end,
                      decoration: authFieldDecoration.copyWith(
                          hintText: '...الرمز السري'),
                    ),

                    30.verticalSpace,

                    ///
                    ///  Button
                    ///
                    CustomButton(
                      onButtonClick: () {
                        value.verifyOtp(context, email);
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
      ),
    );
  }
}
