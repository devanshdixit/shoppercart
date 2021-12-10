import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:shopperscart/ui/categories/categories_viewmodel.dart';
import 'package:shopperscart/ui/shared/constants.dart';
import 'package:shopperscart/ui/shared/styles.dart';
import 'package:shopperscart/ui/shared/ui_helpers.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoriesViewModel>.reactive(
      onModelReady: (model) {
        model.setStore();
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Categories',
            style: titleTextStyle,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
          ],
        ),
        body: model.isBusy
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
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
                      verticalSpaceSmall,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(Assets.locIcon),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                      verticalSpaceSmall,
                      GestureDetector(
                        onTap: () => model.navigateToSelectStore(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(Assets.storeIcon),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Your Store',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      color: blackText,
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth(context) / 1.6,
                                    child: Text(
                                      model.store,
                                      style: const TextStyle(
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
                      verticalSpaceRegular,
                      const Text(
                        'Select categories from this store',
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
                                padding:
                                    EdgeInsets.all(screenWidth(context) / 36),
                                child: CategoriesCard(
                                  onTap: () => model.navigateToProductList(),
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
      viewModelBuilder: () => CategoriesViewModel(),
    );
  }
}

class CategoriesCard extends StatelessWidget {
  final String title;
  final String image;
  final Function() onTap;
  const CategoriesCard({
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
        width: screenWidth(context) / 4,
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
