import 'package:monasebty/core/constants/app_assets.dart';
import 'package:monasebty/core/model/soonest_appointment_model.dart';
import 'package:monasebty/core/model/home_soonest_appointments.dart';
import 'package:monasebty/core/model/special_offer.dart';
import 'package:monasebty/core/model/special_offer_sub_model.dart';
import 'package:monasebty/core/model/venue.dart';
import 'package:monasebty/core/services/database_services.dart';
import 'package:monasebty/core/view_model/base_view_model.dart';

class HomeScreenViewModel extends BaseViewModel {
  ///
  ///
  ///
  ///for special  offer in home screen
  ///
  final _dbService = DatabaseService();
  List<Venue> venues = [];
  List<Venue> specialOfferVenues = [];
//List<Venue> specialOfferVenues = [];
  HomeScreenViewModel() {
    getVenues();
  }
  getVenues() async {
    try {
      venues = await _dbService.getVenues() ?? [];
      specialOfferVenues = venues
          .where((venu) => venu.discount != null && venu.discount!.isNotEmpty)
          .toList();
    } catch (e) {
      print("error occured $e");
    }
    notifyListeners();
  }

  List<SpecialOfferModel> listSpecialOffer = [
    SpecialOfferModel(
        imgUrl: AppAssets.venue,
        price: "12،000 دينار",
        GroupName: "قاعة ستريملاين للمناسبات",
        description: "طرابلس، النوفليين، شارع احمد رفيق المهدوي"),
    SpecialOfferModel(
        imgUrl: AppAssets.venue,
        price: "12،000 دينار",
        GroupName: "قاعة ستريملاين للمناسبات",
        description: "طرابلس، النوفليين، شارع احمد رفيق المهدوي"),
    SpecialOfferModel(
        imgUrl: AppAssets.venue,
        price: "12،000 دينار",
        GroupName: "قاعة ستريملاين للمناسبات",
        description: "طرابلس، النوفليين، شارع احمد رفيق المهدوي"),
    SpecialOfferModel(
        imgUrl: AppAssets.venue,
        price: "12،000 دينار",
        GroupName: "قاعة ستريملاين للمناسبات",
        description: "طرابلس، النوفليين، شارع احمد رفيق المهدوي")
  ];

  ///
  ///
  ///         for list in bottom of special offer in home screen
  List<SpecialOfferSubModel> listHomeScreen_1_list = [
    SpecialOfferSubModel(imgUrl: AppAssets.star, text: "4.3 من 5"),
    SpecialOfferSubModel(imgUrl: AppAssets.star, text: "4.3 من 5"),
    SpecialOfferSubModel(imgUrl: AppAssets.star, text: "4.3 من 5"),
    SpecialOfferSubModel(imgUrl: AppAssets.star, text: "4.3 من 5"),
  ];

  ///
  ///
  ///
  ///               for soonest appointments in home screen
  ///
  List<SoonestAppointmentsModel> listSoonestAppoint = [
    SoonestAppointmentsModel(
        imgUrl: AppAssets.venue,
        price: "12،000 دينار",
        GroupName: "قاعة ستريملاين للمناسبات",
        discription: "طرابلس، النوفليين، شارع احمد رفيق المهدوي"),
    SoonestAppointmentsModel(
        imgUrl: AppAssets.venue,
        price: "12،000 دينار",
        GroupName: "قاعة ستريملاين للمناسبات",
        discription: "طرابلس، النوفليين، شارع احمد رفيق المهدوي"),
    SoonestAppointmentsModel(
        imgUrl: AppAssets.venue,
        price: "12،000 دينار",
        GroupName: "قاعة ستريملاين للمناسبات",
        discription: "طرابلس، النوفليين، شارع احمد رفيق المهدوي"),
    SoonestAppointmentsModel(
        imgUrl: AppAssets.venue,
        price: "12،000 دينار",
        GroupName: "قاعة ستريملاين للمناسبات",
        discription: "طرابلس، النوفليين، شارع احمد رفيق المهدوي"),
  ];

  ///
  ///
  ///      for list in bottom of  soonest appointments in home screen
  ///
  List<SoonestAppointmentSubModel> list_HomeSoonestAppointment_List = [
    SoonestAppointmentSubModel.SoonestAppointmentSubModel(
        imgUrl: AppAssets.star, text: "4.3 من 5"),
    SoonestAppointmentSubModel.SoonestAppointmentSubModel(
        imgUrl: AppAssets.star, text: "4.3 من 5")
  ];
}
