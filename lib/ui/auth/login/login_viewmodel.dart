import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yoga/app/app.locator.dart';
import 'package:yoga/app/app.router.dart';
import 'package:yoga/ui/auth/base/authentication_viewmodel.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

import 'login_view.form.dart';

class LoginViewModel extends AuthenticationViewModel {
  final FirebaseAuthenticationService? _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  LoginViewModel() : super(successRoute: Routes.startUpView);

  @override
  Future<FirebaseAuthenticationResult> runAuthentication() =>
      _firebaseAuthenticationService!.loginWithEmail(
        email: emailValue!,
        password: passwordValue!,
      );

  void navigateToCreateAccount() =>
      navigationService.navigateTo(Routes.createAccountView);
}
