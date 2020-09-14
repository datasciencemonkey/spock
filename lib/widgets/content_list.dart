import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:omnikit/models/models.dart';
import 'package:omnikit/pages/pages.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOriginals;

  const ContentList({
    Key key,
    @required this.title,
    @required this.contentList,
    this.isOriginals = false,
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: isOriginals ? 500.0 : 220.0,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: contentList.length,
              itemBuilder: (BuildContext context, int index) {
                final Content content = contentList[index];
                return GestureDetector(
                  onTap: () {
                    _getLocation();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductPage(
                          itemDescription: content.description,
                          itemImage: content.imageUrl,
                          itemName: content.name,
                          itemPrice: content.price,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        height: isOriginals ? 400.0 : 150.0,
                        width: isOriginals ? 270.0 : 220.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(content.imageUrl),
                            fit: isOriginals ? BoxFit.cover : BoxFit.cover,
                          ),
                        ),
                        // child:  ListTile(
                        //   contentPadding: EdgeInsets.fromLTRB(10.0, 100.0, 10.0, 0.0),
                        //     tileColor: Colors.transparent,
                        //     leading: Icon(Icons.favorite),
                        //     trailing: Icon(FontAwesomeIcons.cartPlus),
                        //     onTap: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: isOriginals
                            ? null
                            : Text(
                                content.name,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
