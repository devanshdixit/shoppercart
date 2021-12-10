import 'package:shopperscart/app/app.locator.dart';
import 'package:shopperscart/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CartViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  void navigateToSelectStore(bool bool) {
    if (bool) {
      _navigationService.navigateTo(Routes.orderConfigureView);
    } else {
      _navigationService.clearStackAndShow(Routes.startUpView);
    }
  }
}
