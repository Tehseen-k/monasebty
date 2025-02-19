// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monasebty/core/constants/app_assets.dart';
import 'package:monasebty/core/constants/auth_field_decoration.dart';
import 'package:monasebty/core/constants/colors.dart';
import 'package:monasebty/core/constants/strings.dart';
import 'package:monasebty/core/model/venue.dart';
import 'package:monasebty/ui/screens/special_offer_detail/special_offer_view_model.dart';
import 'package:provider/provider.dart';

class SpecialOfferDetailScreen extends StatelessWidget {
  List<Venue> specialOfferVenues = [];

  SpecialOfferDetailScreen({required this.specialOfferVenues});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SpecialOfferDetailViewModel(),
        child: Consumer<SpecialOfferDetailViewModel>(
            builder: (context, model, child) => Scaffold(
                backgroundColor: loginPageColor,

                ///
                /// App Bar
                ///
                appBar: _appBar(),

                ///
                /// Start Body
                ///

                body: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: specialOfferVenues.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 250,
                        margin: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: sinUpPageColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              specialOfferVenues[index]
                                                      .imageUrl ??
                                                  ""),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(top: 30),
                                  width: 90.w,
                                  decoration:
                                      BoxDecoration(color: secondaryColor),
                                  child: Text(
                                    "${specialOfferVenues[index].discount}",
                                    style: style12.copyWith(color: whiteColor),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "${specialOfferVenues[index].description}",
                              style: style16.copyWith(color: secondaryColor),
                            ),
                            10.verticalSpace,
                          ],
                        ),
                      );
                    }))));
  }
}

AppBar _appBar() {
  return AppBar(
    toolbarHeight: 160,
    elevation: 0.0,
    automaticallyImplyLeading: false,
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
                  'محمد نوح',
                  style: style16,
                ),
              ],
            ),
            15.horizontalSpace,
            CircleAvatar(
              backgroundColor: secondaryColor,
              radius: 20.r,
              backgroundImage: AssetImage(AppAssets.profile),
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
