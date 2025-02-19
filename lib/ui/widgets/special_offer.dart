// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monasebty/core/constants/app_assets.dart';
import 'package:monasebty/core/constants/colors.dart';
import 'package:monasebty/core/model/venue.dart';
import 'dart:math' as math;
import '../../core/constants/strings.dart';

class CustomSpecialOffer extends StatelessWidget {
  Venue specialOffer;

  CustomSpecialOffer({required this.specialOffer});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topRight, children: [
      Container(
          width: 343.w,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: Color(0xfffF2EEEA),
              borderRadius: BorderRadius.circular(20)),
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
                              image: NetworkImage("${specialOffer.imageUrl}"),
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
                                  style:
                                      style12.copyWith(color: secondaryColor),
                                )),
                          )
                        ],
                      ),
                    ),

                    10.verticalSpace,

                    ///
                    /// Price
                    ///
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          alignment: Alignment.center,
                          // height: 20.h,
                          decoration: BoxDecoration(
                              color: Color(0xffF8E0BA).withOpacity(0.75),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              "${specialOffer.price}",
                              style: style14.copyWith(
                                  fontSize: 11.sp,
                                  color: blackColor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            "${specialOffer.name}",
                            overflow: TextOverflow.ellipsis,
                            style: style16.copyWith(
                              color: blackColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],

                      ///
                      ///        description of image
                      ///
                    ),

                    Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "${specialOffer.description}",
                          style: style14.copyWith(
                              fontWeight: FontWeight.w400, fontSize: 13),
                        )),
                    20.verticalSpace,

                    ///
                    ///
                    ///       row in which different categories of special offer are placed

                    Row(
                      children: [
                        CustomHomeSpecialOfferlist(
                          imgUrl: AppAssets.star,
                          text: "${specialOffer.capacity}",
                          width: 140,
                        ),
                        10.horizontalSpace,
                        CustomHomeSpecialOfferlist(
                          imgUrl: AppAssets.star,
                          text: "توجد شاشة عرض",
                          width: 140,
                        ),
                      ],
                    ),
                    // ListView.builder(
                    //   itemCount: 5,
                    //   itemBuilder: (BuildContext context, int index) {
                    //     return GestureDetector(onTap: (){},child: CustomHomeScreen_1_list(object_HomeScreenListModel:model ),);
                    //   },
                    // ),
                  ],
                ),
              ),
            ],
          )),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
            AppAssets.offer,
          ))),
          child: Transform.rotate(
            filterQuality: FilterQuality.high,
            origin: Offset(21, 8),
            angle:
                -math.pi / 0.56, // Rotate the text -45 degrees (anticlockwise)
            child: Text(
              textAlign: TextAlign.center,
              'تخفيض',
              style: style10.copyWith(
                color: whiteColor,
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}

///
///
///
///   listView in bottom of first widget in home screen

class CustomHomeSpecialOfferlist extends StatelessWidget {
  //HomeScreen_1_listModel object_HomeScreenListModel = HomeScreen_1_listModel();
  final String imgUrl;
  final String text;
  final double width;
  CustomHomeSpecialOfferlist(
      {
      //required this.object_HomeScreenListModel
      required this.imgUrl,
      required this.text,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xffF8E0BA), borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          // Text("${object_HomeScreenListModel.text}"),
          Text(text),
          Container(
              height: 10,
              width: 20,
              child: Image.asset(
                imgUrl, scale: 5,
                //  "${object_HomeScreenListModel.imgUrl}",
                //   AppAssets.star,
              ))
        ],
      ),
    );
  }
}
