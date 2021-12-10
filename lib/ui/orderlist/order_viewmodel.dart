import 'package:shopperscart/app/app.locator.dart';
import 'package:shopperscart/ui/orderstatus/order_status_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OrderViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigateToOrderStatusView(
      String orderNum, bool orderComplete, int orderStage) {
    _navigationService.navigateToView(
      OrderStatusView(
        orderNum: orderNum,
        orderComplete: orderComplete,
        orderStage: orderStage,
      ),
    );
  }
}
