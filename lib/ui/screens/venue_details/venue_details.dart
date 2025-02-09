import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:monasebty/core/constants/app_assets.dart';
import 'package:monasebty/core/constants/colors.dart';
import 'package:monasebty/core/constants/strings.dart';
import 'package:monasebty/core/model/venue.dart';
import 'package:monasebty/ui/screens/booking/booking_screen.dart';
import 'package:monasebty/ui/screens/venue_details/venue_view_model.dart';
import 'package:monasebty/ui/widgets/buttons/custom_button.dart';
import 'package:monasebty/ui/widgets/soonest_appointments.dart';
import 'package:provider/provider.dart';

class VenueDetailsScreen extends StatelessWidget {
  Venue venue;
  VenueDetailsScreen({required this.venue});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => VenueDetailsViewModel(),
        child: Consumer<VenueDetailsViewModel>(
            builder: (context, model, child) => Scaffold(

                ///
                /// Start Body
                ///

                body: DefaultTabController(
                    length: 3,
                    child: SingleChildScrollView(
                        child: Column(children: [
                      Stack(children: [
                        ///
                        /// Header image Slider
                        ///
                        _imageSliderSection([
                          venue.imageUrl!,
                          venue.imageUrl!,
                          venue.imageUrl!,
                          venue.imageUrl!,
                        ]),

                        ///
                        /// Bottom container
                        ///

                        Padding(
                          padding: const EdgeInsets.only(top: 350.0),
                          child: Container(
                            height: 700,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0xffFEFAF5),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 20.h),
                                Text(
                                  "${venue.name}",
                                  style: style16.copyWith(
                                      color: secondaryColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20.sp),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  "${venue.description}",
                                  style: style16.copyWith(
                                      color: blackColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.0.sp),
                                ),
                                SizedBox(height: 20.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomSoonestAppointmentsSubCategory(
                                        imgUrl: AppAssets.location,
                                        text: "${venue.address}"),
                                    SizedBox(width: 20.w),
                                    CustomSoonestAppointmentsSubCategory(
                                        imgUrl: AppAssets.phone,
                                        text: "${venue.location}"),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Container(
                                  width: 380.w, // Divider length
                                  child: Divider(
                                    thickness: 0.5,
                                    color: Color(0xfffACACAC),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: TabBar(
                                      tabAlignment: TabAlignment.center,
                                      labelPadding:
                                          EdgeInsets.symmetric(horizontal: 45),
                                      isScrollable: true,
                                      dividerColor: secondaryColor,
                                      indicatorSize: TabBarIndicatorSize.tab,
                                      dividerHeight: 3,
                                      indicatorWeight: 3.0,
                                      indicatorColor: indicatorColor,
                                      tabs: [
                                        Tab(
                                          child: Text(
                                            "About",
                                            style: style14.copyWith(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Tab(
                                          child: Text("Reviews"),
                                        ),
                                        Tab(
                                          child: Text("Bio"),
                                        )
                                      ]),
                                ),
                                Expanded(
                                    child: TabBarView(children: [
                                  ///
                                  ///  About us
                                  ///
                                  _about(),

                                  ///
                                  ///  Review
                                  ///
                                  ///
                                  _reviewSection1(),

                                  ///
                                  /// Bio
                                  ///
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        Text(
                                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sit amet enim ac enim pretium ornare. Aenean sagittis libero vitae metus cursus tincidunt. Ut eget imperdiet lacus, nec pretium justo. Etiam ac nunc tellus. Pellentesque sed accumsan ex. Aliquam dictum imperdiet est, ut faucibus quam eleifend nec. Aliquam eleifend erat vel pulvinar dapibus. "),
                                        50.verticalSpace,
                                        CustomButton(
                                            onButtonClick: () {
                                              Get.to(
                                                BookingScreen(),
                                              );
                                            },
                                            title: 'احجز الان')
                                      ],
                                    ),
                                  )
                                ]))
                              ],
                            ),
                          ),
                        )
                      ]),
                    ]))))));
  }

  _about() {
    return ListView(
      padding: EdgeInsets.all(20),
      shrinkWrap: true,
      children: [
        CustomSpecialListTile(
          leadImgUrl: AppAssets.star2,
          title: 'Rated 4.98',
          subtitle: '1250 reviews',
          trailIcon: Icons.arrow_forward_ios,
        ),
        Divider(),
        CustomSpecialListTile(
          leadImgUrl: AppAssets.star2,
          title: 'Number Of Bookings',
          subtitle: '1839',
          trailIcon: Icons.arrow_forward_ios,
        ),
        Divider(),
        CustomSpecialListTile(
          leadImgUrl: AppAssets.star2,
          title: 'Price',
          subtitle: '${venue.price}',
          trailIcon: Icons.arrow_forward_ios,
        ),
        30.verticalSpace,
        CustomButton(onButtonClick: () {}, title: 'احجز الان')
      ],
    );
  }

  ///
  ///  Image Slider
  ///
  Widget _imageSliderSection(List<String> images) {
    final PageController pageController = PageController();

    int currentIndex = 0;

    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          height: 450.h,
          width: double.infinity,
          child: Stack(
            children: [
              PageView.builder(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    images[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
              Positioned(
                top: 20.h,
                left: 20.w,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: CircleAvatar(
                    radius: 18.r,
                    backgroundColor: Color(0xffff5f5f5),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: secondaryColor,
                    ),
                  ),
                ),
              ),

              ///
              /// BACK and Forword
              ///

              Positioned(
                bottom: 120.h,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (currentIndex > 0) {
                          pageController.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        }
                      },
                      icon: CircleAvatar(
                        radius: 16,
                        backgroundColor: Color(0xffff5f5f5),
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: secondaryColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 20.h),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffF5F5F5).withOpacity(0.85),
                      ),
                      child: Text(
                        '${currentIndex + 1}/${images.length}',
                        style: style12.copyWith(color: secondaryColor),
                      ),
                    ),
                    SizedBox(width: 20.h),
                    IconButton(
                      onPressed: () {
                        if (currentIndex < images.length - 1) {
                          pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        }
                      },
                      icon: CircleAvatar(
                        radius: 16,
                        backgroundColor: Color(0xffff5f5f5),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

///
///  List Tile
///
class CustomSpecialListTile extends StatelessWidget {
  final String leadImgUrl;
  final String title;
  final String subtitle;
  final IconData? trailIcon;

  const CustomSpecialListTile(
      {required this.leadImgUrl,
      required this.title,
      required this.subtitle,
      this.trailIcon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        color: loginPageColor,
        height: 20,
        width: 20,
        child: Image.asset(
          leadImgUrl,
          scale: 1.5,
        ),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: IconButton(
          onPressed: () {},
          icon: CircleAvatar(
              backgroundColor: secondaryColor,
              child: Icon(trailIcon, color: whiteColor, size: 16.sp))),
    );
  }
}

///
///  Review
///

_rating(
    {required double intinitialRating,
    required String number,
    required String percentage}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      RatingBar(
        size: 25.sp,
        filledIcon: Icons.star,
        emptyIcon: Icons.star_border,
        onRatingChanged: (value) => debugPrint('$value'),
        initialRating: intinitialRating,
        maxRating: 5,
      ),
      20.horizontalSpace,
      Text(
        "$number",
        style: style14.copyWith(color: secondaryColor),
      ),
      20.horizontalSpace,
      Text("($percentage%)", style: style14),
    ],
  );
}

_reviewSection1() {
  return ListView(
    padding: EdgeInsets.all(20),
    shrinkWrap: true,
    children: [
      Text(
        "1250 Reviews",
        style: style16.copyWith(fontWeight: FontWeight.w400),
      ),
      Text(
        "4.88 out of 5.0",
        style: style14,
      ),
      20.verticalSpace,
      _rating(intinitialRating: 5, number: '255', percentage: '40'),
      _rating(intinitialRating: 4, number: '200', percentage: '38'),
      _rating(intinitialRating: 3, number: '25', percentage: '10'),
      _rating(intinitialRating: 2, number: '25', percentage: '10'),
      _rating(intinitialRating: 1, number: '10', percentage: '2'),
      40.verticalSpace,
      CustomButton(onButtonClick: () {}, title: 'احجز الان')
    ],
  );
}
