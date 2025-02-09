import 'package:monasebty/core/view_model/base_view_model.dart';

class SoonestAppointmentSubModel extends BaseViewModel {
  String? imgUrl;
  String? text;
  // final double width;
  SoonestAppointmentSubModel.SoonestAppointmentSubModel({
    this.imgUrl,
    this.text, // required this.width
  });
}
