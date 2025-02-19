import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:monasebty/core/model/venue.dart';
import 'package:monasebty/core/services/auth_services.dart';
import 'package:monasebty/core/services/database_services.dart';
import 'package:monasebty/ui/locaor.dart';

class BookingViewModel extends ChangeNotifier{
    bool isLoading = false;
  final _dbService = DatabaseService();
  final _authServices = locator<AuthServices>();
  newBooking(Venue venue, startTime,endTime,context) async {
    try {
      isLoading = true;
      notifyListeners();
      final data = {
        "book": "email",
        "venue": venue.id,
        "user": _authServices.user?.id,
        "start_time": startTime,
         "end_time": endTime,
        "total_price": venue.price,
        "payment_status": "pending",
        "status": "pending",
      };
      final isBooked = await _dbService.newBooking(data);
      if (isBooked) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Booked")));
        // Get.offAll(LoginScreen());
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error Occured, try again")));
      }
    } catch (e) {
    
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error Occured, $e")));
      print("error occured : $e");
    }
    isLoading = false;
    notifyListeners();
  }

}