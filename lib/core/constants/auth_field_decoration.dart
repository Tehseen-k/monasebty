import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monasebty/core/constants/colors.dart';
import 'package:monasebty/core/constants/strings.dart';

final authFieldDecoration = InputDecoration(
  hintText: "Enter your email",
  hintStyle: style16.copyWith(color: greyColor),
  prefixIconColor: greyColor,
  suffixIconColor: greyColor,
  fillColor: filledColor,
  filled: true,
  // contentPadding: EdgeInsets.all(20),
  border: InputBorder.none,
  enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: secondaryColor, width: 1.0),
      borderRadius: BorderRadius.circular(20.r)),
  focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: secondaryColor, width: 1.0),
      borderRadius: BorderRadius.circular(20.r)),
  errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: secondaryColor, width: 1.0),
      borderRadius: BorderRadius.circular(20.r)),
  disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: secondaryColor, width: 1.0),
      borderRadius: BorderRadius.circular(20.r)),
  focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: secondaryColor, width: 1.0),
      borderRadius: BorderRadius.circular(20.r)),
);
