import 'package:flutter/material.dart';
import 'package:shopperscart/ui/orderstatus/order_status_viewmodel.dart';
import 'package:shopperscart/ui/shared/constants.dart';
import 'package:shopperscart/ui/shared/styles.dart';
import 'package:shopperscart/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class OrderStatusView extends StatelessWidget {
  const OrderStatusView({
    Key? key,
    required this.orderNum,
    required this.orderComplete,
    required this.orderStage,
  }) : super(key: key);
  final String orderNum;
  final bool orderComplete;
  final int orderStage;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrderStatusViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            'Order #$orderNum',
            style: titleTextStyle,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceRegular,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Scheduled',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: blackText.withOpacity(0.9),
                        ),
                      ),
                      Text(
                        '6:39 pm',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceRegular,
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 35,
                      ),
                      horizontalSpaceRegular,
                      Text(
                        'December 12, 2021',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceRegular,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: screenWidth(context) / 4.7,
                        color: orderStage >= 1 ? Colors.green : Colors.grey,
                        height: 4,
                      ),
                      Container(
                        width: screenWidth(context) / 4.7,
                        color: orderStage >= 2 ? Colors.green : Colors.grey,
                        height: 4,
                      ),
                      Container(
                        width: screenWidth(context) / 4.7,
                        color: orderStage >= 3 ? Colors.green : Colors.grey,
                        height: 4,
                      ),
                      Container(
                        width: screenWidth(context) / 4.7,
                        color: orderStage >= 4 ? Colors.green : Colors.grey,
                        height: 4,
                      ),
                    ],
                  ),
                  verticalSpaceSmall,
                  Text(
                    orderStage <= 1
                        ? 'Your order is received'
                        : orderStage <= 2
                            ? 'Your order is confirmed'
                            : orderStage <= 3
                                ? 'We are packaging your products'
                                : orderStage <= 4
                                    ? 'We are on the way'
                                    : 'NA',
                    style: TextStyle(
                      fontSize: 16,
                      color: blackText,
                    ),
                  ),
                  verticalSpaceRegular,
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: primaryColor.withOpacity(0.2),
                      ),
                      height: 50,
                      child: Center(
                        child: Text(
                          'Show Delivery Details',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  verticalSpaceRegular,
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: primaryColor.withOpacity(0.2),
                      ),
                      height: 50,
                      child: Center(
                        child: Text(
                          'Show full package',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  verticalSpaceRegular,
                  Text(
                    'Delivery Location',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: blackText.withOpacity(0.9),
                    ),
                  ),
                  verticalSpaceRegular,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(Assets.locIcon),
                      horizontalSpaceRegular,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: screenWidth(context) / 1.5,
                            child: Text(
                              'Floor 4, Wakil Tower, Ta 131 Gulshan Badda Link Road',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                color: blackText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  Container(
                    color: Colors.grey.shade300,
                    height: 2,
                  ),
                  verticalSpaceSmall,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: TextStyle(
                          fontSize: 18,
                          color: blackText,
                        ),
                      ),
                      Text(
                        '362',
                        style: TextStyle(
                          fontSize: 18,
                          color: blackText,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceTiny,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Charge',
                        style: TextStyle(
                          fontSize: 18,
                          color: blackText,
                        ),
                      ),
                      Text(
                        '50',
                        style: TextStyle(
                          fontSize: 18,
                          color: blackText,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceTiny,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: blackText,
                        ),
                      ),
                      Text(
                        '412',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: blackText,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Method',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: blackText.withOpacity(0.9),
                        ),
                      ),
                      verticalSpaceRegular,
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            color: lightBg,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Image.asset(Assets.curr),
                                    horizontalSpaceRegular,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('You selected'),
                                        Text(
                                          'Cash on Delivery',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: blackText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      verticalSpaceRegular,
                      Text(
                        'Cash on derivery has some potential risks of spreading contamination. You can select other payment methods for a contactless safe delivery.',
                        style: TextStyle(
                          color: blackText.withOpacity(0.8),
                        ),
                      ),
                      verticalSpaceRegular,
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: primaryColor,
                          ),
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    'Contact with Support',
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 40,
                                child: Icon(
                                  Icons.chat_bubble_outline,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      verticalSpaceSmall,
                      orderStage <= 1
                          ? InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    )),
                                height: 50,
                                child: Center(
                                  child: Text(
                                    'Cancel Order',
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 16,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                      verticalSpaceRegular,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        // bottomNavigationBar: Container(
        //   height: 125,
        //   padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
        //   child: Column(
        //     children: [
        //       InkWell(
        //         onTap: () {},
        //         child: Container(
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(7),
        //             color: primaryColor,
        //           ),
        //           height: 50,
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Expanded(
        //                 child: Center(
        //                   child: Text(
        //                     'Place Order',
        //                     style: TextStyle(
        //                       fontFamily: "Poppins",
        //                       fontSize: 18,
        //                       color: Colors.white,
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               SizedBox(
        //                 width: 50,
        //                 child: Icon(
        //                   Icons.arrow_forward,
        //                   color: Colors.white,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //       verticalSpaceSmall,
        //       InkWell(
        //         onTap: () {},
        //         child: Container(
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(7),
        //             color: primaryColor,
        //           ),
        //           height: 50,
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Expanded(
        //                 child: Center(
        //                   child: Text(
        //                     'Place Order',
        //                     style: TextStyle(
        //                       fontFamily: "Poppins",
        //                       fontSize: 18,
        //                       color: Colors.white,
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               SizedBox(
        //                 width: 50,
        //                 child: Icon(
        //                   Icons.arrow_forward,
        //                   color: Colors.white,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
      viewModelBuilder: () => OrderStatusViewModel(),
    );
  }
}
