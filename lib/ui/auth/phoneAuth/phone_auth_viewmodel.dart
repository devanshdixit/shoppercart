import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/src/firebase_authentication_service.dart';
import 'package:shopperscart/app/app.locator.dart';
import 'package:shopperscart/app/app.router.dart';
import 'package:shopperscart/ui/auth/base/authentication_viewmodel.dart';

class PhoneAuthViewModel extends AuthenticationViewModel {
  PhoneAuthViewModel() : super(successRoute: Routes.startUpView);
  final FirebaseAuthenticationService? _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();
  String verificationId = '';
  bool isOtp = false, loading = false;
  String emailValue = "", passwordValue = "";

  @override
  Future<FirebaseAuthenticationResult> runAuthentication() =>
      _firebaseAuthenticationService!.loginWithEmail(
        email: emailValue,
        password: passwordValue,
      );

  void updateOtpState(bool otpState, String verifyId) {
    isOtp = otpState;
    verificationId = verifyId;
    loading = false;
    notifyListeners();
  }

  void updateLoading(bool state) {
    loading = state;
    notifyListeners();
  }

  void verifyOtp(String smscode) {
    codeverify(smscode, verificationId);
  }
}
