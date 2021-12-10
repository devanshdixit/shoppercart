import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:shopperscart/ui/auth/phoneAuth/phone_auth_view.form.dart';
import 'package:shopperscart/ui/auth/phoneAuth/phone_auth_viewmodel.dart';
import 'package:shopperscart/ui/shared/constants.dart';
import 'package:country_picker/country_picker.dart';
import 'package:shopperscart/ui/shared/ui_helpers.dart';

@FormView(fields: [
  FormTextField(name: 'mobileNo'),
  FormTextField(name: 'otp'),
])
class PhoneAuthView extends StatelessWidget with $PhoneAuthView {
  PhoneAuthView({Key? key}) : super(key: key);
  final SmsAutoFill _autoFill = SmsAutoFill();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PhoneAuthViewModel>.reactive(
      onModelReady: (model) async {
        final hintNum = await _autoFill.hint;
        if (hintNum != null) {
          mobileNoController.text = hintNum;
        }
      },
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.bgtop),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  verticalSpaceRegular,
                  Center(
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Image.asset(Assets.auth),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      model.isOtp
                          ? 'Enter Verification Code'
                          : 'Enter your mobile number',
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      model.isOtp
                          ? 'We have sent SMS to: ${mobileNoController.text}'
                          : 'We need to verify you. We will send you a one time verification code. ',
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                        color: Color.fromARGB(110, 55, 71, 79),
                      ),
                    ),
                  ),
                  verticalSpaceRegular,
                  !model.isOtp
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 50,
                                height: 65,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color:
                                      const Color.fromARGB(255, 240, 241, 242),
                                ),
                                alignment: AlignmentDirectional.center,
                                child: InkWell(
                                  onTap: () {
                                    showCountryPicker(
                                      context: context,
                                      exclude: <String>['KN', 'MF'],
                                      showPhoneCode: true,
                                      onSelect: (Country country) {
                                        // print(
                                        //     'Select country: ${country.displayName}');
                                      },
                                      countryListTheme: CountryListThemeData(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(40.0),
                                          topRight: Radius.circular(40.0),
                                        ),
                                        inputDecoration: InputDecoration(
                                          labelText: 'Search',
                                          hintText: 'Start typing to search',
                                          prefixIcon: const Icon(Icons.search),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: const Color(0xFF8C98A8)
                                                  .withOpacity(0.2),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    '+91',
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: TextFormField(
                                    onFieldSubmitted: (value) {
                                      model.updateLoading(true);
                                      String mobNum = '';
                                      if (mobileNoController.text
                                          .contains('+91')) {
                                        mobNum = mobileNoController.text;
                                      } else {
                                        mobNum =
                                            '+91' + mobileNoController.text;
                                      }
                                      model.loginwithMobile(
                                        mobNum,
                                        context,
                                        updateOtp: (isOtp, verificationId) {
                                          model.updateOtpState(
                                              isOtp, verificationId);
                                        },
                                      );
                                    },
                                    controller: mobileNoController,
                                    decoration: const InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 240, 241, 242),
                                      labelText: "Phone Number",
                                      labelStyle: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                  model.isOtp
                      ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            onFieldSubmitted: (value) {
                              model.updateLoading(true);
                              model.verifyOtp(otpController.text);
                            },
                            controller: otpController,
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              filled: true,
                              fillColor: Color.fromARGB(255, 240, 241, 242),
                              labelText: "Enter Otp",
                              labelStyle: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 16,
                            ),
                          ),
                        )
                      : const SizedBox(),
                  verticalSpaceLarge,
                  InkWell(
                    onTap: () {
                      model.updateLoading(true);
                      if (model.isOtp) {
                        model.verifyOtp(otpController.text);
                      } else {
                        String mobNum = '';
                        if (mobileNoController.text.contains('+91')) {
                          mobNum = mobileNoController.text;
                        } else {
                          mobNum = '+91' + mobileNoController.text;
                        }
                        model.loginwithMobile(
                          mobNum,
                          context,
                          updateOtp: (isOtp, verificationId) {
                            model.updateOtpState(isOtp, verificationId);
                          },
                        );
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 94, 196, 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: model.loading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: screenWidth(context) / 2.5,
                                  child: const Text(
                                    'Next',
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => PhoneAuthViewModel(),
    );
  }
}
