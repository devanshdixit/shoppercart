import 'package:shopperscart/app/app.locator.dart';
import 'package:shopperscart/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OrderStatusViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  navigateToPaymentMethod() {
    _navigationService.navigateTo(Routes.paymentOptionsView);
  }
}
