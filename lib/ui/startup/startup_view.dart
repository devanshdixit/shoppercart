import 'package:flutter/scheduler.dart';
import 'package:shopperscart/ui/cart/cart_view.dart';
import 'package:shopperscart/ui/profile/profile_view.dart';
import 'package:shopperscart/ui/shared/constants.dart';
import 'package:shopperscart/ui/shared/styles.dart';
import 'package:shopperscart/ui/shared/ui_helpers.dart';
import 'package:shopperscart/ui/startup/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  final int? bottomNavigationIndex;
  StartUpView({Key? key, this.bottomNavigationIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      onModelReady: (model) async {
        SchedulerBinding.instance?.addPostFrameCallback((timeStamp) async {
          await model.runStartupLogic();
          if (bottomNavigationIndex != null) {
            model.updateBottomNavigation(bottomNavigationIndex!);
          }
        });
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Shoppers Cart',
            style: titleTextStyle,
          ),
          actions: [
            IconButton(
              onPressed: () => model.navigateToNotification(),
              icon: const Icon(Icons.notifications),
            ),
          ],
        ),
        body: SafeArea(
          child: model.isBusy
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )
              : model.bottomNavigationIndex == 1
                  ? CartView()
                  : model.bottomNavigationIndex == 2
                      ? ProfileView()
                      : Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(Assets.bgtop),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                verticalSpaceTiny,
                                InkWell(
                                  onTap: () => model.navigateToAddress(),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(Assets.locIcon),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Your Location',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 13,
                                                color: blackText,
                                              ),
                                            ),
                                            SizedBox(
                                              width: screenWidth(context) / 1.6,
                                              child: const Text(
                                                '32 Llanberis Close, Tonteg, CF38',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: blackText,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Icon(Icons.arrow_forward_ios),
                                      ],
                                    ),
                                  ),
                                ),
                                verticalSpaceSmall,
                                const Text(
                                  'Select stores in your Location',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    fontSize: 18,
                                    color: blackText,
                                  ),
                                ),
                                verticalSpaceSmall,
                                Wrap(
                                  children: shopList
                                      .map(
                                        (item) => Padding(
                                          padding: EdgeInsets.all(
                                              screenWidth(context) / 39),
                                          child: StoreCard(
                                            onTap: () =>
                                                model.navigateToCategories(
                                                    item.name),
                                            image: item.imagepath,
                                            title: item.name,
                                          ),
                                        ),
                                      )
                                      .toList()
                                      .cast<Widget>(),
                                ),
                                verticalSpaceRegular,
                              ],
                            ),
                          ),
                        ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: model.bottomNavigationIndex,
          selectedItemColor: primaryColor,
          onTap: (int index) {
            model.updateBottomNavigation(index);
          },
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Cart',
              icon: Image.asset(Assets.bag),
            ),
            BottomNavigationBarItem(
              label: 'Menu',
              icon: Image.asset(Assets.menu),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => StartUpViewModel(),
    );
  }
}

class StoreCard extends StatelessWidget {
  final String title;
  final String image;
  final Function() onTap;
  const StoreCard({
    Key? key,
    required this.image,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(
                0,
                3,
              ),
            ),
          ],
        ),
        width: screenWidth(context) / 3.8,
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
            verticalSpaceSmall,
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
                fontSize: 14,
                color: blackText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
