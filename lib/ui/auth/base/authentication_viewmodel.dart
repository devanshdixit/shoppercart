import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopperscart/app/app.locator.dart';
import 'package:shopperscart/app/app.logger.dart';
import 'package:shopperscart/app/app.router.dart';
import 'package:shopperscart/exceptions/firestore_api_exception.dart';
import 'package:shopperscart/models/application_models.dart' as model;
import 'package:shopperscart/services/push_notification_service.dart';
import 'package:shopperscart/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

abstract class AuthenticationViewModel extends FormViewModel {
  final log = getLogger('AuthenticationViewModel');
  String chosenValue = 'Vehicle';
  final userService = locator<UserService>();
  final pushNotification = locator<PushNotificationService>();
  final navigationService = locator<NavigationService>();

  final firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  final String successRoute;
  AuthenticationViewModel({required this.successRoute});

  String setType = '';

  @override
  void setFormStatus() {}

  void upDateAccountType(String? value) {
    chosenValue = value!;
    notifyListeners();
  }

  Future loginwithMobile(String mobile, BuildContext context,
      {required Function(bool isOtp, String verificationId) updateOtp}) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.verifyPhoneNumber(
      phoneNumber: mobile,
      timeout: const Duration(seconds: 120),
      verificationCompleted: (PhoneAuthCredential authCredential) {
        _auth.signInWithCredential(authCredential).then((result) {
          log.v('Result after signInWithCredential ${result.user}');
          navigationService.clearStackAndShow(Routes.startUpView);
        }).catchError((e) {
          throw FirestoreApiException(message: '$e');
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          throw Exception('The provided phone number is not valid.');
        }
      },
      codeSent: (String verifyId, int? resendToken) async {
        updateOtp(true, verifyId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  codeverify(String smscode, String verifyId) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verifyId,
      smsCode: smscode,
    );
    await auth
        .signInWithCredential(credential)
        .then((UserCredential result) async {
      await handleAuthenticationResponse(
          FirebaseAuthenticationResult(user: result.user));
      log.v('Auth result is $result');
      navigationService.clearStackAndShow(successRoute);
    }).catchError((e) {
      throw FirestoreApiException(message: '$e');
    });
    navigationService.clearStackAndShow(Routes.startUpView);
  }

  Future<FirebaseAuthenticationResult> runAuthentication();

  Future saveData({required String type}) async {
    log.i('valued:$formValueMap');
    try {
      final result =
          await runBusyFuture(runAuthentication(), throwException: true);
      setType = type;
      await handleAuthenticationResponse(result);
    } on FirestoreApiException catch (e) {
      log.e(e.toString());
      setValidationMessage(e.toString());
    }
  }

  Future<void> useGoogleAuthentication({required String type}) async {
    final result = await firebaseAuthenticationService.signInWithGoogle();
    setType = type;
    await handleAuthenticationResponse(result);
  }

  Future<void> useAppleAuthentication() async {
    final result = await firebaseAuthenticationService.signInWithApple(
      appleClientId: '',
      appleRedirectUri:
          'https://boxtout-production.firebaseapp.com/__/auth/handler',
    );
    await handleAuthenticationResponse(result);
  }

  Future<void> handleAuthenticationResponse(
      FirebaseAuthenticationResult authResult) async {
    log.v('authResult.hasError:${authResult.hasError}');

    if (!authResult.hasError && authResult.user != null) {
      final user = authResult.user!;
      String token = await pushNotification.getPushNotificationToken();
      if (token.isNotEmpty) {
        await userService.syncOrCreateUserAccount(
          user: model.User(
            id: user.uid,
            email: user.email,
            name: user.displayName ?? user.email,
            photourl: user.photoURL ??
                'https://img.icons8.com/color/48/000000/gender-neutral-user.png',
            pushToken: token,
            mobileNo: '',
          ),
        );
      }
      // navigate to success route
      navigationService.clearStackAndShow(successRoute);
    } else {
      if (!authResult.hasError && authResult.user == null) {
        log.wtf(
            'We have no error but the uer is null. This should not be happening');
      }

      log.w('Authentication Failed: ${authResult.errorMessage}');

      setValidationMessage(authResult.errorMessage);
      notifyListeners();
    }
  }
}
