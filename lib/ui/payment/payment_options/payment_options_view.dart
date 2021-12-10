import 'package:flutter/material.dart';
import 'package:shopperscart/ui/payment/payment_options/payment_options_viewmodel.dart';
import 'package:shopperscart/ui/shared/constants.dart';
import 'package:shopperscart/ui/shared/styles.dart';
import 'package:shopperscart/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class PaymentOptionsView extends StatelessWidget {
  const PaymentOptionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PaymentOptionsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Payment Method',
            style: titleTextStyle,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                verticalSpaceLarge,
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(Assets.credit),
                        horizontalSpaceSmall,
                        Text(
                          'Credit / Debit Card',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceSmall,
                    Container(
                      color: Colors.grey.shade200,
                      height: 2,
                    )
                  ],
                ),
                verticalSpaceRegular,
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(Assets.bank),
                        horizontalSpaceSmall,
                        Text(
                          'Bank Online Payment',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceSmall,
                    Container(
                      color: Colors.grey.shade200,
                      height: 2,
                    )
                  ],
                ),
                verticalSpaceRegular,
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(Assets.curren),
                        horizontalSpaceSmall,
                        Text(
                          'Cash on Delivery',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceSmall,
                    Container(
                      color: Colors.grey.shade200,
                      height: 2,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => PaymentOptionsViewModel(),
    );
  }
}
