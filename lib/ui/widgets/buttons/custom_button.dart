// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monasebty/core/constants/colors.dart';
import 'package:monasebty/core/constants/strings.dart';

class CustomButton extends StatelessWidget {
  VoidCallback? onButtonClick;
  String? title;

  CustomButton({
    required this.onButtonClick,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonClick,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: secondaryColor, borderRadius: BorderRadius.circular(20.r)),
        child: Text(
          "$title",
          style: style16.copyWith(color: whiteColor),
        ),
      ),
    );
  }
}
