import 'package:monasebty/core/view_model/base_view_model.dart';

class VenueDetailsViewModel extends BaseViewModel {
  ///
  ///
  ///     for text color changing in tabbar
  ///
  bool isSelected = false;
  bool isRated = false;

  void onClick() {
    isSelected = isSelected;
    isRated = !isRated;
    notifyListeners();
  }
}
