// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monasebty/core/constants/colors.dart';
import 'package:monasebty/core/constants/strings.dart';

class SocialButton extends StatelessWidget {
  VoidCallback? onButtonClick;
  String? title;
  String? iconImg;

  SocialButton({
    required this.onButtonClick,
    required this.title,
    required this.iconImg,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonClick,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: whiteColor,
            border: Border.all(color: secondaryColor, width: 1.0),
            borderRadius: BorderRadius.circular(20.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "   ",
            ),
            Text(
              "$title",
              style: style16.copyWith(color: secondaryColor),
            ),
            Image.asset(
              "$iconImg",
              scale: 3,
            )
          ],
        ),
      ),
    );
  }
}
