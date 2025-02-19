import 'package:monasebty/core/view_model/base_view_model.dart';

class SpecialOfferModel extends BaseViewModel {
  String? imgUrl;
  String? GroupName;
  String? price;
  String? description;

  SpecialOfferModel({
    this.imgUrl,
    this.GroupName,
    this.price,
    this.description,
  });
}
