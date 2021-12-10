import 'package:flutter/material.dart';
import 'package:shopperscart/ui/orderlist/order_viewmodel.dart';
import 'package:shopperscart/ui/shared/constants.dart';
import 'package:shopperscart/ui/shared/styles.dart';
import 'package:shopperscart/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class OrderView extends StatefulWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  List<Shop> order = <Shop>[
    Shop('Associated Dairies', Assets.asda),
    Shop('Co-operative', Assets.coop),
    Shop('Costco', Assets.cosco),
  ];
  List<Shop> ordercompleted = <Shop>[
    Shop('Associated Dairies', Assets.asda),
    Shop('Costco', Assets.cosco),
  ];
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrderViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Orders',
            style: titleTextStyle,
          ),
          bottom: TabBar(
            padding: EdgeInsets.symmetric(horizontal: 20),
            controller: tabController,
            indicatorColor: Colors.green,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: primaryColor,
                  width: 2,
                ),
              ),
            ),
            labelColor: primaryColor,
            unselectedLabelColor: blackText,
            tabs: <Tab>[
              Tab(
                child: Text(
                  'Ongoing',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Completed',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: new TabBarView(controller: tabController, children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // order.length == 0
                //     ? Column(
                //         children: [
                //           Container(
                //             child: Center(
                //               child: Image.asset(Assets.emptyorder),
                //             ),
                //           ),
                //           Text(
                //             'There is no ongoing order right now.',
                //             style: TextStyle(
                //               fontWeight: FontWeight.w700,
                //               fontFamily: "Poppins",
                //               fontSize: 16,
                //               color: blackText,
                //             ),
                //           ),
                //           Text(
                //             'You can order from home.',
                //             style: TextStyle(
                //               fontWeight: FontWeight.w700,
                //               fontFamily: "Poppins",
                //               fontSize: 16,
                //               color: blackText,
                //             ),
                //           ),
                //         ],
                //       )
                //     : ListView.builder(
                //         physics: NeverScrollableScrollPhysics(),
                //         shrinkWrap: true,
                //         itemCount: order.length,
                //         itemBuilder: (context, index) {
                //           Product data = Product(
                //             order[index].name,
                //             order[index].imagepath,
                //             0 + index,
                //           );
                //           return OrderCard();
                //         },
                //       ),

                verticalSpaceSmall,

                OrderCard(
                  onTap: () => model.navigateToOrderStatusView('241', false, 1),
                  date: 'September 2, 2021',
                  orderNum: '241',
                  price: '456',
                  status: 'Ongoing',
                ),
                OrderCard(
                  onTap: () => model.navigateToOrderStatusView('247', false, 3),
                  date: 'September 12, 2021',
                  orderNum: '247',
                  price: '554',
                  status: 'Ongoing',
                ),
                verticalSpaceSmall,
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ordercompleted.length != 0
                //     ? Column(
                //         children: [
                //           Container(
                //             child: Center(
                //               child: Image.asset(Assets.emptyorder),
                //             ),
                //           ),
                //           Text(
                //             'There is no ongoing order right now.',
                //             style: TextStyle(
                //               fontWeight: FontWeight.w700,
                //               fontFamily: "Poppins",
                //               fontSize: 16,
                //               color: blackText,
                //             ),
                //           ),
                //           Text(
                //             'You can order from home.',
                //             style: TextStyle(
                //               fontWeight: FontWeight.w700,
                //               fontFamily: "Poppins",
                //               fontSize: 16,
                //               color: blackText,
                //             ),
                //           ),
                //         ],
                //       )
                //     : ListView.builder(
                //         physics: NeverScrollableScrollPhysics(),
                //         shrinkWrap: true,
                //         itemCount: ordercompleted.length,
                //         itemBuilder: (context, index) {
                //           Product data = Product(
                //             ordercompleted[index].name,
                //             ordercompleted[index].imagepath,
                //             0 + index,
                //           );
                //           return OrderCard();
                //         },
                //       ),
                verticalSpaceSmall,
                OrderCard(
                  onTap: () => model.navigateToOrderStatusView('231', false, 2),
                  date: 'July 21, 2021',
                  orderNum: '231',
                  price: '789',
                  status: 'Delivered',
                ),
                OrderCard(
                  onTap: () => model.navigateToOrderStatusView('224', false, 4),
                  date: 'March 14, 2021',
                  orderNum: '224',
                  price: '234',
                  status: 'Cancelled',
                ),
                verticalSpaceSmall,
              ],
            ),
          ),
        ]),
      ),
      viewModelBuilder: () => OrderViewModel(),
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.orderNum,
    required this.date,
    required this.price,
    required this.status,
    required this.onTap,
  }) : super(key: key);
  final String orderNum;
  final String date;
  final String status;
  final String price;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        Assets.ordericon,
                      ),
                    ),
                    horizontalSpaceRegular,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order #$orderNum',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            fontSize: 18,
                            color: blackText,
                          ),
                        ),
                        Text(
                          status,
                          style: TextStyle(
                            fontSize: 12,
                            color: status == "Cancelled"
                                ? Colors.red
                                : Colors.green,
                          ),
                        ),
                        Text(
                          date,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins",
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        horizontalSpaceLarge,
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    '@$price',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: "Poppins",
                      fontSize: 20,
                      color: Color.fromRGBO(243, 122, 32, 1),
                    ),
                  ),
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
      ),
    );
  }
}
