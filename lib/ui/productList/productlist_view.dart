import 'package:flutter/material.dart';
import 'package:shopperscart/main.dart';
import 'package:shopperscart/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:shopperscart/ui/productList/productListHelpers.dart';
import 'package:shopperscart/ui/productList/productlist_viewmodel.dart';
import 'package:shopperscart/ui/shared/constants.dart';
import 'package:shopperscart/ui/shared/styles.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  int initPosition = 1;
  MyStore store = VxState.store;

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddtoCart]);
    return ViewModelBuilder<ProductListViewModel>.reactive(
      onModelReady: (model) {
        model.setStore();
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Products',
            style: titleTextStyle,
          ),
          actions: [
            InkWell(
              onTap: () {
                model.navigateToCart();
              },
              child: Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.green.shade700,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      Text(
                        'Cart :',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      horizontalSpaceTiny,
                      VxBuilder<dynamic>(
                        mutations: {RemovefromCart},
                        builder: (context, store, status) => Text(
                          '${store.cart.length}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      horizontalSpaceSmall
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: model.isBusy
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
                  child: CustomTabView(
                    initPosition: initPosition,
                    itemCount: shopList.length,
                    tabBuilder: (context, index) =>
                        Tab(text: shopList[index].name),
                    pageBuilder: (context, index) {
                      return SubCustomTabView(
                        initPosition: 0,
                        itemCount: shopList.length,
                        tabBuilder: (context, index) =>
                            Tab(text: shopList[index].name),
                        pageBuilder: (context, index) {
                          return SingleChildScrollView(
                            child: Wrap(
                              children: shopList
                                  .map(
                                    (item) => ProductListItem(
                                      item: item,
                                      model: model,
                                    ),
                                  )
                                  .toList()
                                  .cast<Widget>(),
                            ),
                          );
                        },
                        onPositionChange: (index) {
                          print('current position: $index');
                          initPosition = index;
                        },
                        onScroll: (position) {},
                        stub: SizedBox(),
                      );
                    },
                    onPositionChange: (index) {
                      print('current position: $index');
                      initPosition = index;
                    },
                    onScroll: (position) {},
                    stub: SizedBox(),
                  ),
                ),
        ),
      ),
      viewModelBuilder: () => ProductListViewModel(),
    );
  }
}

class ProductListItem extends StatefulWidget {
  final Shop item;
  final ProductListViewModel model;
  const ProductListItem({
    required this.item,
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  MyStore store = VxState.store;
  int itemcount = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(screenWidth(context) / 42),
          child: ProductListCard(
            onTap: () {},
            image: widget.item.imagepath,
            title: widget.item.name,
          ),
        ),
        Positioned(
          top: 10,
          left: 70,
          child: InkWell(
            onTap: () {
              setState(() {
                itemcount++;
              });
              final st = store.cart
                  .where((element) => element['title'] == widget.item.name);
              if (st.isEmpty) {
                AddtoCart({
                  'image': widget.item.imagepath,
                  'title': widget.item.name,
                  'count': itemcount,
                });
              } else {
                final product = store.cart.indexWhere(
                    (element) => element['title'] == widget.item.name);
                store.cart[product] = {
                  'image': widget.item.imagepath,
                  'title': widget.item.name,
                  'count': itemcount,
                };
              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 2,
                    blurRadius: 1,
                    offset: const Offset(
                      0,
                      1,
                    ),
                  ),
                ],
              ),
              child: Icon(
                Icons.add,
                color: primaryColor,
              ),
            ),
          ),
        ),
        itemcount != 0
            ? Positioned(
                top: 40,
                left: 75,
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      '$itemcount',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            : SizedBox(),
        itemcount != 0
            ? Positioned(
                top: 60,
                left: 70,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      itemcount--;
                    });
                    if (itemcount != 0) {
                      final index = store.cart.indexWhere(
                          (element) => element['title'] == widget.item.name);
                      store.cart[index] = {
                        'image': widget.item.imagepath,
                        'title': widget.item.name,
                        'count': itemcount,
                      };
                    } else {
                      final index = store.cart.indexWhere(
                          (element) => element['title'] == widget.item.name);
                      RemovefromCart(index);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset: const Offset(
                            0,
                            1,
                          ),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.cancel_outlined,
                      color: primaryColor,
                    ),
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
