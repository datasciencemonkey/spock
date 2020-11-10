import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:omnikit/models/models.dart';
import 'package:omnikit/pages/pages.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;
  final Content alternateContent;

  const ContentHeader({
    Key key,
    this.featuredContent,
    this.alternateContent,
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
    final List<Content> imageList = [featuredContent, alternateContent];
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 500.0,
            disableCenter: true,
            viewportFraction: 1.0,
            autoPlay: true,
          ),
          items: imageList.map((item) {
            // int index = imageList.indexOf(item);
            return GestureDetector(
              onTap: () {
                _getLocation();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductPage(
                      itemDescription: item.description,
                      itemImage: item.imageUrl,
                      itemName: item.name,
                      itemPrice: item.price,
                      isFeatured: true,
                    ),
                  ),
                );
              },
              child:  Container(
                  height: 500.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(item.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        item.title.toString(),
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
            );
          }).toList(),
        ),

        // ),
        // Container(
        //   height: 500.0,
        //   decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: [Colors.black38, Colors.transparent],
        //       begin: Alignment.bottomCenter,
        //       end: Alignment.topCenter,
        //     ),
        //   ),
        // ),
        // Positioned(
        //   bottom: 20.0,
        //   left: 100.0,
        //   child: SizedBox(
        //     width: _deviceWidth * .8,
        //     child: Text(
        //       featuredContent.title.toString(),
        //       style: TextStyle(
        //         fontSize: 20.0,
        //         fontWeight: FontWeight.w600,
        //         color: Colors.white,
        //         letterSpacing: 2.0,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
