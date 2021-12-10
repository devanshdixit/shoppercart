// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String MobileNoValueKey = 'mobileNo';
const String OtpValueKey = 'otp';

mixin $PhoneAuthView on StatelessWidget {
  final TextEditingController mobileNoController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final FocusNode mobileNoFocusNode = FocusNode();
  final FocusNode otpFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    mobileNoController.addListener(() => _updateFormData(model));
    otpController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            MobileNoValueKey: mobileNoController.text,
            OtpValueKey: otpController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    mobileNoController.dispose();
    otpController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get mobileNoValue => this.formValueMap[MobileNoValueKey];
  String? get otpValue => this.formValueMap[OtpValueKey];

  bool get hasMobileNo => this.formValueMap.containsKey(MobileNoValueKey);
  bool get hasOtp => this.formValueMap.containsKey(OtpValueKey);
}

extension Methods on FormViewModel {}
