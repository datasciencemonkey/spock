import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:omnikit/models/models.dart';
import 'package:omnikit/pages/pages.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;

  const ContentHeader({
    Key key,
    this.featuredContent,
  }) : super(key: key);
  void _getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);
    print(position);
    print(placemark.map(
        (e) => ' ${e.name}, ${e.locality}, ${e.country}, ${e.postalCode}'));
  }

  @override
  Widget build(BuildContext context) {
    final _deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        _getLocation();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductPage(
              itemDescription: featuredContent.description,
              itemImage: featuredContent.imageUrl,
              itemName: featuredContent.name,
              itemPrice: featuredContent.price,
              isFeatured: true,
            ),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 500.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(featuredContent.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 500.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black87, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 100.0,
            child: SizedBox(
              width: _deviceWidth * .8,
              child: Text(
                featuredContent.title.toString(),
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: 2.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
