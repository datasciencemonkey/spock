import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:omnikit/pages/pages.dart';

class ProductPage extends StatefulWidget {
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
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          widget.itemName,
        ),
        actions: [
          // FlatButton(child:Image(image:AssetImage('assets/images/omnikit.png'),),onPressed: (){}),
          IconButton(
            icon: Icon(FontAwesomeIcons.shoppingCart),
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
              fit: widget.isFeatured ? BoxFit.fill : BoxFit.cover,
              image: AssetImage(widget.itemImage),
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
              'Product: ${widget.itemName}',
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
                widget.itemDescription,
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
                  'Price: ${widget.itemPrice}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70.0,
        child: FlatButton(
          color: Colors.amberAccent,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CartPage(),
            ),
          ),
          child: Text(
            'Add to Cart',
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
      ),
    );
  }
}
