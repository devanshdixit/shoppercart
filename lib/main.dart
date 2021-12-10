import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopperscart/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:shopperscart/services/push_notification_service.dart';
import 'package:shopperscart/ui/BottomSheetUi/setup_bottom_sheet_ui.dart';
import 'app/app.locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  setPathUrlStrategy();
  setupBottomSheetUi();
  final _pushNotification = locator<PushNotificationService>();
  _pushNotification.initializePushNotificationService();
  runApp(
    VxState(
      store: MyStore(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Colors.green,
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}

class MyStore extends VxStore {
  Map<String, dynamic> data = {};
  String selectedStore = '';
  List cart = [];
}

class AddtoCart extends VxMutation<MyStore> {
  final Map<String, dynamic> items;

  AddtoCart(this.items);
  @override
  perform() {
    store!.cart.add(items);
  }
}

class RemovefromCart extends VxMutation<MyStore> {
  final int index;

  RemovefromCart(this.index);
  @override
  perform() {
    store!.cart.removeAt(index);
  }
}

class SaveData extends VxMutation<MyStore> {
  final Map<String, dynamic> data;

  SaveData(this.data);
  @override
  perform() {
    store!.data.addAll(data);
  }
}

class SaveStore extends VxMutation<MyStore> {
  final String selectedStore;

  SaveStore({required this.selectedStore});
  @override
  perform() {
    store!.selectedStore = selectedStore;
  }
}

class GetSelectedStore extends VxMutation<MyStore> {
  @override
  perform() {
    return store!.selectedStore;
  }
}
