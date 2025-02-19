// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_it/get_it.dart';
import 'package:monasebty/core/constants/app_assets.dart';
import 'package:monasebty/core/constants/auth_field_decoration.dart';
import 'package:monasebty/core/constants/colors.dart';
import 'package:monasebty/core/constants/strings.dart';
import 'package:monasebty/core/services/auth_services.dart';
import 'package:monasebty/ui/screens/home/home_view_model.dart';
import 'package:monasebty/ui/screens/profile/profile_screen.dart';
import 'package:monasebty/ui/screens/special_offer_detail/special_offer_detail_screen.dart';
import 'package:monasebty/ui/screens/venue_details/venue_details.dart';
import 'package:monasebty/ui/widgets/soonest_appointments.dart';
import 'package:monasebty/ui/widgets/special_offer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _authService = GetIt.instance<AuthServices>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeScreenViewModel(),
      child: Consumer<HomeScreenViewModel>(
        builder: (context, model, child) => Scaffold(
          ///
          /// App Bar
          ///
          appBar: _appBar(_authService.user?.username),

          ///
          /// Start Body
          ///
          body: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: loginPageColor,
              // image: DecorationImage(
              //     colorFilter:
              //         ColorFilter.mode(starColor, BlendMode.values[5]),
              //     image: AssetImage(
              //       AppAssets.bg,
              //     ),
              //     fit: BoxFit.cover)
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.h.verticalSpace,

                  ///
                  /// Special offers
                  ///
                  _specialOffer(),

                  model.specialOfferVenues.isNotEmpty
                      ? SizedBox(
                          height: 280.h,
                          child: ListView.builder(
                            itemCount: model.specialOfferVenues.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  // eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzM4ODQzMTA5LCJpYXQiOjE3Mzg4NDI4MDksImp0aSI6ImQ3YTRiODc4N2IyYzQxMzk5MDMwM2M5OGE0ZTY3MzNkIiwidXNlcl9pZCI6M30.FbrB53ClIxaYRKMY_R3IE7_zx1dlaZ0juHSA7MstylA
                                  // eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzM4ODQzMTA5LCJpYXQiOjE3Mzg4NDI4MDksImp0aSI6ImQ3YTRiODc4N2IyYzQxMzk5MDMwM2M5OGE0ZTY3MzNkIiwidXNlcl9pZCI6M30.FbrB53ClIxaYRKMY_R3IE7_zx1dlaZ0juHSA7MstylA
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SpecialOfferDetailScreen(
                                                specialOfferVenues:
                                                    model.specialOfferVenues,
                                              )));
                                },
                                child: CustomSpecialOffer(
                                    specialOffer:
                                        model.specialOfferVenues[index]),
                              );
                            },
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 40.0, bottom: 40),
                          child: Center(
                            child: Text(
                              "لا يوجد عرض الأماكن",
                              style: style16.copyWith(color: primaryColor),
                            ),
                          ),
                        ),
                  30.verticalSpace,

                  ///
                  /// The soonest appointments
                  ///

                  _soonestAppointments(),
                  model.venues.isNotEmpty
                      ? SizedBox(
                          height: 300.h,
                          child: ListView.builder(
                            itemCount: model.venues.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VenueDetailsScreen(
                                                  venue: model.venues[index],
                                                )));
                                  },
                                  child: CustomSoonestAppointments(
                                      soonestAppointment: model.venues[index]));
                            },
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 80.0),
                          child: Center(
                            child: Text(
                              "لا يوجد عرض الأماكن",
                              style: style16.copyWith(color: primaryColor),
                            ),
                          ),
                        ),
                  30.verticalSpace
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

///
/// Search Bar
///

_searchBar() {
  return TextFormField(
    textAlign: TextAlign.end,
    decoration: authFieldDecoration.copyWith(
        fillColor: greyColor.withOpacity(0.15),
        hintText: '...البحث',
        prefixIcon: Image.asset(
          AppAssets.filter,
          scale: 4,
        ),
        suffixIcon: Image.asset(
          AppAssets.search,
          scale: 4,
        ),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
            borderRadius: BorderRadius.circular(32.r)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
            borderRadius: BorderRadius.circular(32.r)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
            borderRadius: BorderRadius.circular(32.r)),
        disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
            borderRadius: BorderRadius.circular(32.r)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
            borderRadius: BorderRadius.circular(32.r))),
  );
}

///
/// App Bar
///

AppBar _appBar(name) {
  return AppBar(
    toolbarHeight: 160,
    elevation: 0.0,
    backgroundColor: loginPageColor,
    surfaceTintColor: loginPageColor,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: secondaryColor.withOpacity(0.05),
              radius: 20.r,
              child: Image.asset(
                AppAssets.notifications,
                height: 20,
                width: 20,
              ),
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '!...صباح الخي',
                  style: style16.copyWith(color: greyColor),
                ),
                Text(
                  "${name ?? '...'}",
                  style: style16,
                ),
              ],
            ),
            15.horizontalSpace,
            InkWell(
              onTap: () {
                Get.to(
                  () => ProfileScreen(),
                );
              },
              child: CircleAvatar(
                backgroundColor: secondaryColor,
                radius: 20.r,
                backgroundImage: AssetImage(AppAssets.profile),
              ),
            ),
            20.horizontalSpace,
          ],
        ),
        30.verticalSpace,

        ///
        /// Search Bar in AppBar
        ///
        _searchBar(),
      ],
    ),
  );
}

_specialOffer() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ///
        /// View All
        ///
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: Color(0xffF7EEEB),
                borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Text(
                "عرض الكل",
                style: style16.copyWith(
                    color: secondaryColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 12.sp),
              ),
            ),
          ),
        ),
        Text(
          "عروض مميزة",
          style: style16.copyWith(
              color: secondaryColor, fontWeight: FontWeight.w400),
        )
      ],

      ///
      /// List of Data Special Offer
      ///
    ),
  );
}

_soonestAppointments() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ///
        /// View All
        ///
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: Color(0xffF7EEEB),
                borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Text(
                "عرض الكل",
                style: style16.copyWith(
                    color: secondaryColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 12.sp),
              ),
            ),
          ),
        ),
        Text(
          "آقرب المواعيد",
          style: style16.copyWith(
              color: secondaryColor, fontWeight: FontWeight.w400),
        ),
        //20.verticalSpace,
      ],

      ///
      ///
      ///
    ),
  );
}
