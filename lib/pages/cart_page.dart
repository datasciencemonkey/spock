import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
