import 'package:monasebty/core/view_model/base_view_model.dart';

class SpecialOfferSubModel extends BaseViewModel {
  String? imgUrl;
  String? text;
  // final double width;
  SpecialOfferSubModel({
    this.imgUrl,
    this.text, // required this.width
  });
}
