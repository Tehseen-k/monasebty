import 'package:monasebty/core/view_model/base_view_model.dart';

class SoonestAppointmentsModel extends BaseViewModel {
  String? imgUrl;
  String? GroupName;
  String? price;
  String? discription;

  SoonestAppointmentsModel({
    this.imgUrl,
    this.GroupName,
    this.price,
    this.discription,
  });
}
