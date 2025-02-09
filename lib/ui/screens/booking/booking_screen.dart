// lib/main.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monasebty/core/constants/colors.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF581C3D),
        scaffoldBackgroundColor: const Color(0xFF581C3D),
      ),
      home: const BookingScreen(),
    );
  }
}

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  int? _selectedTimeSlot;

  final List<TimeSlot> timeSlots = [
    TimeSlot(1, "08:00am", "08:30am"),
    TimeSlot(2, "08:30am", "09:00am"),
    TimeSlot(3, "09:00am", "09:30am"),
    TimeSlot(4, "09:30am", "10:00am"),
    TimeSlot(5, "10:00am", "10:30am"),
    TimeSlot(6, "10:30am", "11:00am"),
    TimeSlot(7, "11:00am", "11:30am"),
    TimeSlot(8, "11:30am", "12:00pm"),
    TimeSlot(9, "12:00pm", "08:30am"),
    TimeSlot(10, "12:30am", "08:30am"),
    TimeSlot(11, "01:00am", "08:30am"),
    TimeSlot(12, "01:30am", "08:30am"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Title in Arabic
              const Text(
                "قاعة ستريهلين للمناسبات",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Address in Arabic
              const Text(
                "طرابلس, التوفيلين, شارع احمد رفيق المهدوي",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 20),

              // Calendar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TableCalendar(
                  firstDay: DateTime.now(),
                  lastDay: DateTime.now().add(const Duration(days: 365)),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  calendarFormat: CalendarFormat.month,
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: TextStyle(color: Colors.white),
                    leftChevronIcon:
                        Icon(Icons.chevron_left, color: Colors.white),
                    rightChevronIcon:
                        Icon(Icons.chevron_right, color: Colors.white),
                  ),
                  calendarStyle: CalendarStyle(
                    defaultTextStyle: const TextStyle(color: Colors.white),
                    weekendTextStyle: const TextStyle(color: Colors.white),
                    outsideTextStyle:
                        TextStyle(color: Colors.white.withOpacity(0.5)),
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

              // Time slots grid
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            const Text(
                              "-to-",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              slot.endTime,
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

              // Book now button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_selectedDay != null && _selectedTimeSlot != null) {
                      // Implement booking logic here
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Booking Confirmation"),
                          content: Text(
                            "Date: ${DateFormat('yyyy-MM-dd').format(_selectedDay!)}\n"
                            "Time Slot: ${timeSlots[_selectedTimeSlot! - 1].startTime} - "
                            "${timeSlots[_selectedTimeSlot! - 1].endTime}",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("OK"),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFBE3D9),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "احجز الآن",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimeSlot {
  final int id;
  final String startTime;
  final String endTime;

  TimeSlot(this.id, this.startTime, this.endTime);
}
