// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/address/address_view.dart';
import '../ui/auth/create_account/create_account_view.dart';
import '../ui/auth/login/login_view.dart';
import '../ui/auth/phoneAuth/phone_auth_view.dart';
import '../ui/categories/categories_view.dart';
import '../ui/checkout/order_configure/orderconfigure_view.dart';
import '../ui/notifications/notifications_view.dart';
import '../ui/orderlist/order_view.dart';
import '../ui/payment/payment_options/payment_options_view.dart';
import '../ui/productList/productlist_view.dart';
import '../ui/profile/profile_view.dart';
import '../ui/startup/startup_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String createAccountView = '/create-account-view';
  static const String phoneAuthView = '/phone-auth-view';
  static const String loginView = '/login-view';
  static const String categoriesView = '/categories-view';
  static const String productListView = '/product-list-view';
  static const String orderConfigureView = '/order-configure-view';
  static const String paymentOptionsView = '/payment-options-view';
  static const String profileView = '/profile-view';
  static const String orderView = '/order-view';
  static const String addressView = '/address-view';
  static const String notificationView = '/notification-view';
  static const all = <String>{
    startUpView,
    createAccountView,
    phoneAuthView,
    loginView,
    categoriesView,
    productListView,
    orderConfigureView,
    paymentOptionsView,
    profileView,
    orderView,
    addressView,
    notificationView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.createAccountView, page: CreateAccountView),
    RouteDef(Routes.phoneAuthView, page: PhoneAuthView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.categoriesView, page: CategoriesView),
    RouteDef(Routes.productListView, page: ProductListView),
    RouteDef(Routes.orderConfigureView, page: OrderConfigureView),
    RouteDef(Routes.paymentOptionsView, page: PaymentOptionsView),
    RouteDef(Routes.profileView, page: ProfileView),
    RouteDef(Routes.orderView, page: OrderView),
    RouteDef(Routes.addressView, page: AddressView),
    RouteDef(Routes.notificationView, page: NotificationView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartUpView: (data) {
      var args = data.getArgs<StartUpViewArguments>(
        orElse: () => StartUpViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => StartUpView(
          key: args.key,
          bottomNavigationIndex: args.bottomNavigationIndex,
        ),
        settings: data,
      );
    },
    CreateAccountView: (data) {
      var args = data.getArgs<CreateAccountViewArguments>(
        orElse: () => CreateAccountViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => CreateAccountView(key: args.key),
        settings: data,
      );
    },
    PhoneAuthView: (data) {
      var args = data.getArgs<PhoneAuthViewArguments>(
        orElse: () => PhoneAuthViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => PhoneAuthView(key: args.key),
        settings: data,
      );
    },
    LoginView: (data) {
      var args = data.getArgs<LoginViewArguments>(
        orElse: () => LoginViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => LoginView(key: args.key),
        settings: data,
      );
    },
    CategoriesView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const CategoriesView(),
        settings: data,
      );
    },
    ProductListView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ProductListView(),
        settings: data,
      );
    },
    OrderConfigureView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const OrderConfigureView(),
        settings: data,
      );
    },
    PaymentOptionsView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const PaymentOptionsView(),
        settings: data,
      );
    },
    ProfileView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const ProfileView(),
        settings: data,
      );
    },
    OrderView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const OrderView(),
        settings: data,
      );
    },
    AddressView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const AddressView(),
        settings: data,
      );
    },
    NotificationView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const NotificationView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// StartUpView arguments holder class
class StartUpViewArguments {
  final Key? key;
  final int? bottomNavigationIndex;
  StartUpViewArguments({this.key, this.bottomNavigationIndex});
}

/// CreateAccountView arguments holder class
class CreateAccountViewArguments {
  final Key? key;
  CreateAccountViewArguments({this.key});
}

/// PhoneAuthView arguments holder class
class PhoneAuthViewArguments {
  final Key? key;
  PhoneAuthViewArguments({this.key});
}

/// LoginView arguments holder class
class LoginViewArguments {
  final Key? key;
  LoginViewArguments({this.key});
}
