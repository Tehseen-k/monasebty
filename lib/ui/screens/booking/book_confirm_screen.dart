// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:monasebty/core/constants/app_assets.dart';
import 'package:monasebty/core/constants/colors.dart';
import 'package:monasebty/core/model/venue.dart';
import 'package:monasebty/ui/screens/booking/booking_screen.dart';

class BookingConfirmationScreen extends StatelessWidget {
  final DateTime selectedDay;
  final TimeSlot? selectedTimeSlot;
  final Venue venue;
  final String startDateAndTime;
  final String endDateAndTime;

  BookingConfirmationScreen({
    required this.selectedDay,
    required this.selectedTimeSlot,
    required this.venue,
    required this.startDateAndTime,
    required this.endDateAndTime,
  });

  String formatDateTime() {
    DateTime startTime = DateTime.parse(startDateAndTime);

    String formattedTime = DateFormat('h:mma').format(startTime).toLowerCase();
    String formattedDate = DateFormat('EEEE d').format(selectedDay);

    return "$formattedDate, ${selectedTimeSlot?.startTime}";
  }

  @override
  Widget build(BuildContext context) {
    print("Selected Time Slot: ${selectedTimeSlot}");
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0.0),
        decoration: BoxDecoration(
            color: loginPageColor,
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    starColor.withOpacity(0.15), BlendMode.values[10]),
                image: AssetImage(
                  AppAssets.bg,
                ),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            20.verticalSpace,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      scale: 3,
                    ),
                    const SizedBox(height: 40),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF3F3F3F),
                          height: 1.5,
                        ),
                        children: [
                          TextSpan(
                            text: 'Thank you for booking\nwith ',
                          ),
                          TextSpan(
                            text: 'Monasebty',
                            style: TextStyle(
                              color: Color(0xFF800020),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Your booking details:',
                      style: TextStyle(
                        fontSize: 20,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      formatDateTime(),
                      style: TextStyle(
                        fontSize: 18,
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'At The Venue ${venue.name}',
                      style: TextStyle(
                        fontSize: 18,
                        color: primaryColor,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/logo_name.png',
                            height: 60,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
