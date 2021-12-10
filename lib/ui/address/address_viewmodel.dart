import 'package:shopperscart/app/app.locator.dart';
import 'package:shopperscart/ui/address_selection/address_selection_view.dart';
import 'package:shopperscart/ui/address_selection/address_selection_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddressViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  navigateToAddressSelection() {
    _navigationService.navigateToView(AddressSelectionView());
  }
}
