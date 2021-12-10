import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shopperscart/app/app.locator.dart';
import 'package:shopperscart/app/app.router.dart';
import 'package:shopperscart/main.dart';

class ProductListViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  String store = '';

  void setStore() {
    store = GetSelectedStore().perform();
    notifyListeners();
  }

  void navigateToSelectStore() {
    _navigationService.clearStackAndShow(Routes.startUpView);
  }

  void navigateToCart() {
    _navigationService.clearStackAndShow(
      Routes.startUpView,
      arguments: StartUpViewArguments(
        bottomNavigationIndex: 1,
      ),
    );
  }
}
