import 'package:shopperscart/app/app.locator.dart';
import 'package:shopperscart/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  navigateToOrderView() {
    _navigationService.navigateTo(Routes.orderView);
  }
}
