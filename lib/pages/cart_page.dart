import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:omnikit/controllers/cart_products.dart';
import 'package:omnikit/models/models.dart';
import 'package:omnikit/pages/pages.dart';

class CartPage extends StatefulWidget {
  final String itemName;
  final String itemPrice;
  final String itemDescription;
  final String itemImage;

  const CartPage({
    Key key,
    this.itemName,
    this.itemPrice,
    this.itemDescription,
    this.itemImage,
  }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('SHOPPING CART',
            style: TextStyle(
              letterSpacing: 2.0,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            )),
        actions: [
          GetBuilder<UserCartProductsController>(
            builder: (val) => IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => LandingPage(
                    email: val.user,
                  ),
                ),
              ),
              icon: Icon(FontAwesomeIcons.home),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildCart(),
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
            width: Get.width,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order Total',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500)),
                GetBuilder<UserCartProductsController>(
                  builder: (val) {
                    double total = 0.0;
                    val.items.forEach((e) {
                      double priceInDollarsString = double.parse(
                          e.price.substring(e.price.indexOf('\$') + 1));
                      total = total + priceInDollarsString;
                    });
                    return Expanded(
                      child: Text(
                        '\$${format(total)}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.right,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
            width: Get.width,
            height: 100,
            child: Text(
              'Shipping - Free (Annual Ship Pass Member Benefit)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.green,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 70.0,
        child: FlatButton(
          color: Theme.of(context).primaryColor,
          onPressed: () => Get.bottomSheet(
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                padding: const EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 1.0),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Quick Checkout 🛒',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 2.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    CheckboxListTile(
                      title: Text('Pay with card on file'),
                      secondary: Icon(FontAwesomeIcons.creditCard),
                      onChanged: (val) => print('new_card_add_event'),
                      value: true,
                    ),
                    CheckboxListTile(
                      title: Text('Use Default Billing Address'),
                      secondary: Icon(FontAwesomeIcons.addressCard),
                      onChanged: (val) => print('change_bill_address_event'),
                      value: true,
                    ),
                    CheckboxListTile(
                      title: Text('Use Default Shipping Address'),
                      secondary: Icon(FontAwesomeIcons.parachuteBox),
                      onChanged: (val) => print('change_ship_address_event'),
                      value: true,
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          FontAwesomeIcons.ccAmazonPay,
                          size: 30,
                        ),
                        Icon(
                          FontAwesomeIcons.ccApplePay,
                          size: 30,
                        ),
                        Icon(
                          FontAwesomeIcons.ccPaypal,
                          size: 30,
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 70.0,
                        width: Get.width,
                        color: Theme.of(context).primaryColor,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => OrderConfirmation(),
                              ),
                            );
                            Get.back(closeOverlays: true);
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          child: Text(
            '💳 Checkout',
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w300,
                letterSpacing: 2.0),
          ),
        ),
      ),
    );
  }
}

Widget _buildCart() {
  return GetBuilder<UserCartProductsController>(
    builder: (val) => ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: val.items.length,
      itemBuilder: (BuildContext context, int index) {
        final Content content = val.items[index];
        return Dismissible(
          onDismissed: (direction) {
            val.items.removeAt(index);
            val.removeItem(content);
            Get.snackbar('Removed from Cart', 'Item deleted');
          },
          background: Container(
            color: Colors.redAccent,
          ),
          key: UniqueKey(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(content.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '${content.name}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                '${content.price}',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        );
      },
    ),
  );
}

String format(double n) {
  return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
}
