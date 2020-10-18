import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/state_manager.dart';
import 'package:omnikit/controllers/cart_products.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;

  const CustomAppBar({
    Key key,
    this.scrollOffset = 0.0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent
          .withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(
          children: [
            Hero(
              tag: 'logo',
              child: Container(
                margin: EdgeInsets.only(left: 20),
                height: 50.0,
                width: 50.0,
                child: Image(
                  image: AssetImage('assets/images/omnikit.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.userCircle),
              onPressed: () {},
            ),
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
      ),
    );
  }
}
