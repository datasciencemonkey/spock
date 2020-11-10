import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:omnikit/controllers/cart_products.dart';
class OrderConfirmation extends StatelessWidget {
  final randGen = new Random();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
                GetBuilder<UserCartProductsController>(builder: (val) {
              return IconButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  val.emptyCart();
                },
                icon: Icon(Icons.logout),
              );
            }),
              ],
        ),
        body: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Icon(FontAwesomeIcons.boxOpen, size: 100.0, color: Colors.amberAccent),
            ),
            Center(
              child: Text(
                'Order Submitted! \n Your Order# is \n ${randGen.nextInt(9999999)}',
                style: TextStyle(
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


