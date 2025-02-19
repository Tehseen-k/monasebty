// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:monasebty/core/constants/colors.dart';
import 'package:monasebty/core/model/venue.dart';
import 'package:monasebty/ui/screens/booking/book_confirm_screen.dart';
import 'package:monasebty/ui/screens/booking/booking_view_model.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingScreen extends StatefulWidget {
  Venue venue;
  BookingScreen({required this.venue, super.key});
  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  int? _selectedTimeSlot;

  final List<TimeSlot> timeSlots = [
    TimeSlot(1, "08:00 am", "08:30 am"),
    TimeSlot(2, "08:30 am", "09:00 am"),
    TimeSlot(3, "09:00 am", "09:30 am"),
    TimeSlot(4, "09:30 am", "10:00 am"),
    TimeSlot(5, "10:00 am", "10:30 am"),
    TimeSlot(6, "10:30 am", "11:00 am"),
    TimeSlot(7, "11:00 am", "11:30 am"),
    TimeSlot(8, "11:30 am", "12:00 pm"),
    TimeSlot(9, "12:00 pm", "12:30 pm"),
    TimeSlot(10, "12:30 pm", "01:00 pm"),
    TimeSlot(11, "01:00 pm", "01:30 pm"),
    TimeSlot(12, "01:30 pm", "02:00 pm"),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookingViewModel(),
      child: Consumer<BookingViewModel>(
          builder: (context, model, ch) => ModalProgressHUD(
                inAsyncCall: model.isLoading,
                progressIndicator: CircularProgressIndicator(
                  color: primaryColor,
                ),
                child: Scaffold(
                  backgroundColor: primaryColor,
                  body: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            "${widget.venue.name}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${widget.venue.description}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TableCalendar(
                              firstDay: DateTime.now(),
                              lastDay:
                                  DateTime.now().add(const Duration(days: 365)),
                              focusedDay: _focusedDay,
                              selectedDayPredicate: (day) =>
                                  isSameDay(_selectedDay, day),
                              calendarFormat: CalendarFormat.month,
                              headerStyle: const HeaderStyle(
                                formatButtonVisible: false,
                                titleCentered: true,
                                titleTextStyle: TextStyle(color: Colors.white),
                                leftChevronIcon: Icon(Icons.chevron_left,
                                    color: Colors.white),
                                rightChevronIcon: Icon(Icons.chevron_right,
                                    color: Colors.white),
                              ),
                              calendarStyle: CalendarStyle(
                                defaultTextStyle:
                                    const TextStyle(color: Colors.white),
                                weekendTextStyle:
                                    const TextStyle(color: Colors.white),
                                outsideTextStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.5)),
                                selectedDecoration: const BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                                todayDecoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.5),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              onDaySelected: (selectedDay, focusedDay) {
                                setState(() {
                                  _selectedDay = selectedDay;
                                  _focusedDay = focusedDay;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: timeSlots.length,
                              itemBuilder: (context, index) {
                                final slot = timeSlots[index];
                                final isSelected = _selectedTimeSlot == slot.id;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedTimeSlot = slot.id;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Colors.blue
                                          : Colors.white.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${index + 1}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          slot.startTime,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_selectedDay != null &&
                                    _selectedTimeSlot != null) {
                                  String startDateAndTime = formatToISO8601(
                                    _selectedDay!
                                        .toIso8601String()
                                        .split('T')[0],
                                    timeSlots[_selectedTimeSlot! - 1].startTime,
                                  );
                                  String endDateAndTime = formatToISO8601(
                                    _selectedDay!
                                        .toIso8601String()
                                        .split('T')[0],
                                    timeSlots[_selectedTimeSlot! - 1].endTime,
                                  );
                                  print("start time ${startDateAndTime}");
                                  print("end date time ${endDateAndTime}");
                                  await model.newBooking(
                                      widget.venue,
                                      startDateAndTime,
                                      endDateAndTime,
                                      context);
                                  // Get.to(BookingConfirmationScreen(
                                  //     selectedDay: _selectedDay!,
                                  //     selectedTimeSlot: _selectedTimeSlot,
                                  //     venue: widget.venue,
                                  //     startDateAndTime: startDateAndTime,
                                  //     endDateAndTime: endDateAndTime));
                                  Get.to(BookingConfirmationScreen(
                                    selectedDay: _selectedDay!,
                                    selectedTimeSlot:
                                        timeSlots[_selectedTimeSlot! - 1],
                                    venue: widget.venue,
                                    startDateAndTime: startDateAndTime,
                                    endDateAndTime: endDateAndTime,
                                  ));
                                }
                              },
                              child: const Text("احجز الآن"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
    );
  }

  String formatToISO8601(String date, String time) {
    try {
      // Convert 12-hour format to 24-hour format
      final timeComponents = time.toLowerCase().split(' ');
      final hourMin = timeComponents[0].split(':');
      int hour = int.parse(hourMin[0]);
      int minute = int.parse(hourMin[1]);

      // Adjust hour for PM times
      if (timeComponents[1] == 'pm' && hour != 12) {
        hour += 12;
      } else if (timeComponents[1] == 'am' && hour == 12) {
        hour = 0;
      }

      // Parse the date
      final DateTime dateTime = DateTime.parse(date);

      // Create new DateTime with the correct hour and minute
      final DateTime combinedDateTime = DateTime(
        dateTime.year,
        dateTime.month,
        dateTime.day,
        hour,
        minute,
      );

      // Format with timezone offset
      return combinedDateTime.toUtc().toIso8601String();
    } catch (e) {
      print("Error formatting datetime: $date $time - $e");
      return "";
    }
  }
}

class TimeSlot {
  final int id;
  final String startTime;
  final String endTime;

  TimeSlot(this.id, this.startTime, this.endTime);
}
