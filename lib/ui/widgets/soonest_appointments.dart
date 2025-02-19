// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monasebty/core/constants/app_assets.dart';
import 'package:monasebty/core/constants/colors.dart';
import 'package:monasebty/core/model/venue.dart';

import '../../core/constants/strings.dart';

class CustomSoonestAppointments extends StatelessWidget {
  Venue soonestAppointment;

  CustomSoonestAppointments({required this.soonestAppointment});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8),
        width: 343.w,
        decoration: BoxDecoration(
            color: Color(0xfffF2EEEA), borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                children: [
                  ///
                  /// Image
                  ///

                  Container(
                    height: 115.h,
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                NetworkImage("${soonestAppointment.imageUrl}"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                            radius: 17,
                            backgroundColor: Color(0xffff5f5f5),
                            child: Icon(
                              Icons.favorite_border,
                              color: blackColor,
                            )),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffF5F5F5).withOpacity(0.85),
                              ),
                              child: Text(
                                '1/13',
                                style: style12.copyWith(color: secondaryColor),
                              )),
                        )
                      ],
                    ),
                  ),

                  20.verticalSpace,

                  ///
                  /// Price
                  ///
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                        decoration: BoxDecoration(
                            color: Color(0xfffFBBC05),
                            borderRadius: BorderRadius.circular(16.r)),
                        child: Center(
                          child: Text(
                            "دينار  ${soonestAppointment.price}",
                            style: style16.copyWith(
                                color: blackColor, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      Text(
                        "${soonestAppointment.name}",
                        overflow: TextOverflow.ellipsis,
                        style: style16.copyWith(
                          color: blackColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      )
                    ],

                    ///
                    ///  Descrption
                    ///
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "${soonestAppointment.description}",
                          style: style14.copyWith(
                              fontWeight: FontWeight.w400, fontSize: 13),
                        )),
                  ),
                  20.verticalSpacingDiagonal,

                  Row(
                    children: [
                      CustomSoonestAppointmentsSubCategory(
                        imgUrl: AppAssets.guest,
                        text: "${soonestAppointment.capacity}",
                      ),
                      10.horizontalSpace,
                      CustomSoonestAppointmentsSubCategory(
                        imgUrl: AppAssets.projector,
                        text: "توجد شاشة عرض",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

///
///
///
///   listView in bottom of first widget in home screen

class CustomSoonestAppointmentsSubCategory extends StatelessWidget {
  //HomeScreen_1_listModel object_HomeScreenListModel = HomeScreen_1_listModel();
  final String imgUrl;
  final String text;

  CustomSoonestAppointmentsSubCategory({
    //required this.object_HomeScreenListModel
    required this.imgUrl,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Color(0xffF8E0BA), borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: style10.copyWith(color: primaryColor),
          ),
          10.horizontalSpace,
          Container(
              height: 16,
              width: 20,
              child: Image.asset(
                imgUrl,
                scale: 1,
              ))
        ],
      ),
    );
  }
}
