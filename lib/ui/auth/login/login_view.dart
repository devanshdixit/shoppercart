import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:yoga/ui/auth/login/authentication_layout.dart';

import 'login_view.form.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
  FormTextField(name: 'mobileno'),
])
class LoginView extends StatelessWidget with $LoginView {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
          body: AuthenticationLayout(
        busy: model.isBusy,
        onMainButtonTapped: () {
          model.saveData(type: '');
        },
        onCreateAccountTapped: model.navigateToCreateAccount,
        validationMessage: model.validationMessage,
        title: 'Welcome',
        subtitle: 'Enter your email address to sign in.',
        mainButtonTitle: 'SIGN IN',
        form: Column(
          children: [
            Column(
              children: [
                TextField(
                  onChanged: (String? val) {
                    print(mobilenoController.text);
                  },
                  decoration: const InputDecoration(labelText: 'MobileNo'),
                  controller: mobilenoController,
                ),
                ElevatedButton(
                  onPressed: () {
                    model.loginwithMobile(
                      mobilenoController.text,
                      context,
                      updateOtp: (isOtp, verificationId) {},
                    );
                  },
                  child: const Text('SignIn with Mobile'),
                ),
              ],
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Email'),
              controller: emailController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Password'),
              controller: passwordController,
            ),
          ],
        ),
        onForgotPassword: () {},
        onSignInWithGoogle: () {
          model.useGoogleAuthentication(type: '');
        },
        onSignInWithApple: model.useAppleAuthentication,
      )),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
