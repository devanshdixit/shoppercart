import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yoga/app/app.locator.dart';
import 'package:yoga/app/app.logger.dart';
import 'package:yoga/app/app.router.dart';
import 'package:yoga/exceptions/firestore_api_exception.dart';
import 'package:yoga/models/application_models.dart' as model;
import 'package:yoga/services/push_notification_service.dart';
import 'package:yoga/services/user_service.dart';
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

  Future loginwithMobile(String mobile, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
      phoneNumber: mobile,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (AuthCredential authCredential) {
        _auth.signInWithCredential(authCredential).then((result) {
          log.v('Result after signInWithCredential ${result.user}');
          navigationService.clearStackAndShow(Routes.startUpView);
        }).catchError((e) {
          throw FirestoreApiException(message: '$e');
        });
      },
      verificationFailed: (FirebaseAuthException exception) {
        throw FirestoreApiException(message: '$exception');
      },
      codeSent: (String verificationId, [int? forceResendingToken]) {
        final TextEditingController _codeController = TextEditingController();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: const Text("Enter SMS Code"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _codeController,
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("Done"),
                onPressed: () async {
                  FirebaseAuth auth = FirebaseAuth.instance;
                  final smsCode = _codeController.text.trim();
                  final _credential = PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: smsCode,
                  );

                  auth
                      .signInWithCredential(_credential)
                      .then((UserCredential result) async {
                    await handleAuthenticationResponse(
                        FirebaseAuthenticationResult(user: result.user));
                    log.v('Auth result is $result');
                    navigationService.clearStackAndShow(successRoute);
                  }).catchError((e) {
                    throw FirestoreApiException(message: '$e');
                  });
                },
              )
            ],
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationId = verificationId;
        print(verificationId);
        print("Timout");
      },
    );
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
