import 'dart:async';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shopperscart/api/firestore_api.dart';
import 'package:shopperscart/app/app.locator.dart';
import 'package:shopperscart/app/app.logger.dart';
import 'package:shopperscart/app/app.router.dart';
import 'package:shopperscart/main.dart';
import 'package:shopperscart/services/push_notification_service.dart';
import 'package:shopperscart/services/user_service.dart';

class StartUpViewModel extends BaseViewModel {
  final log = getLogger('StartUpViewModel');
  final userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();
  final firestoreApi = locator<FirestoreApi>();
  final _notifyService = locator<PushNotificationService>();
  String userId = '';
  int bottomNavigationIndex = 0;
  Future<void> runStartupLogic() async {
    // setBusy(true);
    // if (userService.hasLoggedInUser) {
    //   log.v('We have a user session on disk. Sync the user profile ...');
    //   await userService.syncUserAccount();
    //   final currentUser = userService.currentUser;
    //   userId = currentUser.id;
    //   log.v('User sync complete. User profile');
    //   if (userService.currentUser.pushToken != _notifyService.pushToken) {
    //     firestoreApi.updateUser(
    //       data: {
    //         'pushToken': _notifyService.pushToken,
    //       },
    //       user: userService.currentUser.id,
    //     );
    //   }
    //   setBusy(false);
    // } else {
    //   log.v('No user on disk, navigate to the LoginView');
    //   setBusy(false);
    //   _navigationService.replaceWith(Routes.phoneAuthView);
    // }
  }
  void navigateToCategories(String storeName) {
    SaveStore(selectedStore: storeName);
    _navigationService.navigateTo(Routes.categoriesView);
  }

  Future<void> logout() async {
    await userService.logout;
    log.v('Successfully Logged out');
    runStartupLogic();
  }

  void updateBottomNavigation(int index) {
    bottomNavigationIndex = index;
    notifyListeners();
  }

  navigateToAddress() {
    _navigationService.navigateTo(Routes.addressView);
  }

  navigateToNotification() {
    _navigationService.navigateTo(Routes.notificationView);
  }
}
