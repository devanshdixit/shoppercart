import 'package:geodesy/geodesy.dart';
import 'package:places_service/places_service.dart';
import 'package:shopperscart/api/firestore_api.dart';
import 'package:shopperscart/services/distance.dart';
import 'package:shopperscart/services/location_service.dart';
import 'package:shopperscart/services/push_notification_service.dart';
import 'package:shopperscart/services/user_service.dart';
import 'package:shopperscart/ui/address/address_view.dart';
import 'package:shopperscart/ui/auth/create_account/create_account_view.dart';
import 'package:shopperscart/ui/auth/login/login_view.dart';
import 'package:shopperscart/ui/auth/phoneAuth/phone_auth_view.dart';
import 'package:shopperscart/ui/categories/categories_view.dart';
import 'package:shopperscart/ui/checkout/order_configure/orderconfigure_view.dart';
import 'package:shopperscart/ui/notifications/notifications_view.dart';
import 'package:shopperscart/ui/orderlist/order_view.dart';
import 'package:shopperscart/ui/payment/payment_options/payment_options_view.dart';
import 'package:shopperscart/ui/productList/productlist_view.dart';
import 'package:shopperscart/ui/profile/profile_view.dart';
import 'package:shopperscart/ui/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    CupertinoRoute(page: StartUpView, initial: true),
    CupertinoRoute(page: CreateAccountView),
    CupertinoRoute(page: PhoneAuthView),
    CupertinoRoute(page: LoginView),
    CupertinoRoute(page: CategoriesView),
    CupertinoRoute(page: ProductListView),
    CupertinoRoute(page: OrderConfigureView),
    CupertinoRoute(page: PaymentOptionsView),
    CupertinoRoute(page: ProfileView),
    CupertinoRoute(page: OrderView),
    CupertinoRoute(page: AddressView),
    CupertinoRoute(page: NotificationView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    Singleton(classType: FirebaseAuthenticationService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: FirestoreApi),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: PushNotificationService),
    LazySingleton(classType: PlacesService),
    LazySingleton(classType: LocationService),
    LazySingleton(classType: Distance),
    LazySingleton(classType: Calculate),
  ],
  logger: StackedLogger(),
)
class AppSetup {}
