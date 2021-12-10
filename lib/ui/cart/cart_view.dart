import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopperscart/main.dart';
import 'package:shopperscart/ui/cart/cart_viewmodel.dart';
import 'package:shopperscart/ui/shared/constants.dart';
import 'package:shopperscart/ui/shared/styles.dart';
import 'package:shopperscart/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyStore store = VxState.store;
    return ViewModelBuilder<CartViewModel>.reactive(
      builder: (context, model, child) => SingleChildScrollView(
        child: VxBuilder<dynamic>(
          mutations: {RemovefromCart},
          builder: (context, store, status) => Container(
            width: double.maxFinite,
            height: screenHeight(context),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.bgtop),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Text(
                      'Products',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: "Poppins",
                        fontSize: 16,
                        color: blackText,
                      ),
                    ),
                  ),
                  store.cart.length == 0
                      ? Container(
                          child: Center(
                            child: Text('no product in your cart'),
                          ),
                        )
                      : ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: store.cart.length,
                          itemBuilder: (context, index) {
                            Product data = Product(
                              store.cart[index]['title'] ?? 'NA',
                              store.cart[index]['image'] ?? '',
                              store.cart[index]['count'] ?? 0,
                            );
                            return data.count != 0
                                ? CartItem(
                                    data: data,
                                    index: index,
                                  )
                                : SizedBox();
                          },
                        ),
                  verticalSpaceSmall,
                  InkWell(
                    onTap: () => model.navigateToSelectStore(
                        store.cart.length == 0 ? false : true),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: store.cart.length == 0
                            ? primaryColor.withOpacity(0.2)
                            : primaryColor,
                      ),
                      height: 50,
                      child: Center(
                        child: Text(
                          store.cart.length == 0
                              ? 'Add More Products'
                              : 'Proceed',
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            color: store.cart.length == 0
                                ? primaryColor
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  verticalSpaceMedium,
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => CartViewModel(),
    );
  }
}

class CartItem extends StatefulWidget {
  const CartItem({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  final Product data;
  final index;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  MyStore store = VxState.store;

  int itemcount = 0;
  @override
  void initState() {
    itemcount = widget.data.count;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.white,
                padding: EdgeInsets.all(5),
                child: Image.asset(
                  widget.data.image,
                  fit: BoxFit.contain,
                ),
              ),
              horizontalSpaceRegular,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      fontSize: 16,
                      color: blackText,
                    ),
                  ),
                  verticalSpaceRegular,
                  Text(
                    '${200 * widget.index + 50}',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: "Poppins",
                      fontSize: 14,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${200 * widget.index + 100}',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: "Poppins",
                          fontSize: 18,
                          color: Color.fromRGBO(243, 122, 32, 1),
                        ),
                      ),
                      horizontalSpaceLarge,
                      InkWell(
                        onTap: () {
                          setState(() {
                            itemcount--;
                          });
                          if (itemcount != 0) {
                            final index = store.cart.indexWhere((element) =>
                                element['title'] == widget.data.name);
                            store.cart[index] = {
                              'image': widget.data.image,
                              'title': widget.data.name,
                              'count': itemcount,
                            };
                          } else {
                            final index = store.cart.indexWhere((element) =>
                                element['title'] == widget.data.name);
                            RemovefromCart(index);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red,
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
                          child: Text(
                            '-',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Text(
                          '$itemcount',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            itemcount++;
                          });
                          final st = store.cart.where((element) =>
                              element['title'] == widget.data.name);
                          if (st.isEmpty) {
                            AddtoCart({
                              'image': widget.data.image,
                              'title': widget.data.name,
                              'count': itemcount,
                            });
                          } else {
                            final product = store.cart.indexWhere((element) =>
                                element['title'] == widget.data.name);
                            store.cart[product] = {
                              'image': widget.data.image,
                              'title': widget.data.name,
                              'count': itemcount,
                            };
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green,
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
                          child: Text(
                            '+',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          verticalSpaceSmall,
          Container(
            color: Colors.grey.shade300,
            height: 2,
          )
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String image;
  final int count;

  Product(this.name, this.image, this.count);
}
