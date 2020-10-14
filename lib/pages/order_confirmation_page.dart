import 'dart:math';

import 'package:flutter/material.dart';

class OrderConfirmation extends StatelessWidget {
  var randGen = new Random();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Text(
                'Order Submitted! Your Order# is ${randGen.nextInt(9999999)}',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
