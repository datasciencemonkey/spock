import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:omnikit/controllers/cart_products.dart';
import 'package:omnikit/models/models.dart';

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
        title: Text('CHECKOUT',
            style: TextStyle(
              letterSpacing: 2.0,
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.home),
          ),
        ],
      ),
      body: GetBuilder<UserCartProductsController>(
        builder: (val) => ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: val.items.length,
          itemBuilder: (BuildContext context, int index) {
            final Content content = val.items[index];
            return Row(
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
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  '${content.price}',
                  style: TextStyle(
                      color: Colors.black,fontSize: 24.0, fontWeight: FontWeight.w500),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
