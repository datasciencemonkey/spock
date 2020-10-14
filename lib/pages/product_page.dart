import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:omnikit/controllers/cart_products.dart';
import 'package:omnikit/models/models.dart';

import 'package:omnikit/pages/pages.dart';

class ProductPage extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String itemDescription;
  final String itemImage;
  final bool isFeatured;

  const ProductPage({
    Key key,
    @required this.itemName,
    @required this.itemPrice,
    @required this.itemDescription,
    @required this.itemImage,
    this.isFeatured = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          itemName,
          style: TextStyle(color:Colors.black87),
        ),
        actions: [
          // FlatButton(child:Image(image:AssetImage('assets/images/omnikit.png'),),onPressed: (){}),
          IconButton(
            icon: Icon(FontAwesomeIcons.shoppingCart),
            color: Colors.black,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CartPage(),
                fullscreenDialog: true,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              width: screenSize.width,
              fit: isFeatured ? BoxFit.fill : BoxFit.cover,
              image: AssetImage(itemImage),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 2, 10, 5),
            child: Text(
              'Product Description',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 2, 10, 5),
            child: Text(
              'Product: $itemName',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 2, 10, 5),
            child: Container(
              child: Text(
                itemDescription,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          SizedBox(height: 2.0),
          Row(
            children: [
              Expanded(
                  child: SizedBox(
                width: screenSize.width * .5,
              )),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 2, 10, 5),
                child: Text(
                  'Price: $itemPrice',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70.0,
        child: GetBuilder<UserCartProductsController>(
          builder: (val) => FlatButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              Content item = Content(
                name: itemName,
                imageUrl: itemImage,
                price: itemPrice,
                description: itemDescription,
              );
              val.addProduct(item);
              _showSnackBar();
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (_) => CartPage(),
              //   ),
              // );
              val.items.forEach((item) {
                print('${item.name} was added to the cart');
              });
            },
            child: Text(
              'Add to Cart',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

_showSnackBar() {
  Get.snackbar('Added to Cart', 'Your item has been added',
      snackPosition: SnackPosition.TOP);
}
