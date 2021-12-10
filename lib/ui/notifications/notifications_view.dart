import 'package:flutter/material.dart';
import 'package:shopperscart/ui/notifications/notifications_viewmodel.dart';
import 'package:shopperscart/ui/shared/styles.dart';
import 'package:shopperscart/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NotificationViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Notifications',
            style: titleTextStyle,
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
          child: InkWell(
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
                        'Add New Address',
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NotificationCard(
                  icon: Icons.list,
                  iconColor: primaryColor,
                  notificationTime: '3:57 PM',
                  onCardTap: () {},
                  onIconTap: () {},
                  orderDesc:
                      'Your Order is Confirmed. Please check everything is okay',
                  orderNum: '345',
                ),
                NotificationCard(
                  iconColor: Colors.green,
                  icon: Icons.call,
                  notificationTime: '2:33 PM',
                  onCardTap: () {},
                  onIconTap: () {},
                  orderDesc: 'Your Order is Delivering to your home',
                  orderNum: '345',
                ),
                NotificationCard(
                  iconColor: Colors.redAccent,
                  icon: Icons.list,
                  notificationTime: '4:12 AM',
                  onCardTap: () {},
                  onIconTap: () {},
                  orderDesc:
                      'Your Order is Confirmed. Please check everything is okay',
                  orderNum: '345',
                ),
                NotificationCard(
                  iconColor: Colors.green,
                  icon: Icons.star,
                  notificationTime: '12:07 AM',
                  onCardTap: () {},
                  onIconTap: () {},
                  orderDesc:
                      'Your Order is Completed. Please  rate the experince',
                  orderNum: '345',
                ),
                NotificationCard(
                  iconColor: Colors.redAccent,
                  icon: Icons.list_alt,
                  notificationTime: '11:01 AM',
                  onCardTap: () {},
                  onIconTap: () {},
                  orderDesc:
                      'Your Order is Confirmed. Please check everything is okay',
                  orderNum: '345',
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => NotificationViewModel(),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key? key,
    required this.orderNum,
    required this.orderDesc,
    required this.notificationTime,
    required this.onIconTap,
    required this.onCardTap,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);
  final String orderNum;
  final String orderDesc;
  final String notificationTime;
  final Function() onIconTap;
  final Function() onCardTap;
  final IconData icon;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCardTap,
      child: Column(
        children: [
          verticalSpaceMedium,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screenWidth(context) / 1.6,
                    child: Text(
                      'Order #$orderNum',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: blackText,
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth(context) / 1.6,
                    child: Text(
                      orderDesc,
                      style: TextStyle(
                        fontSize: 16,
                        color: blackText,
                      ),
                    ),
                  ),
                  horizontalSpaceLarge,
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      notificationTime,
                      style: TextStyle(
                        fontSize: 12,
                        color: blackText,
                      ),
                    ),
                  ),
                  verticalSpaceTiny,
                  InkWell(
                    onTap: onIconTap,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: iconColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        icon,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          verticalSpaceRegular,
          Container(
            color: Colors.grey.shade300,
            height: 2,
          )
        ],
      ),
    );
  }
}
