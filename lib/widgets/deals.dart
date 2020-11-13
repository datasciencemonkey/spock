import 'dart:math';
import '../data/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omnikit/controllers/auth_controller.dart';
import 'package:omnikit/models/models.dart';
// import 'package:omnikit/services/backend_auth_service.dart';

class Deals extends StatelessWidget {
  final String title;
  final List<Content> contentList;

  const Deals({Key key, this.title, this.contentList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // BackEndAuthService authRequest = BackEndAuthService();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 165.0,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
            scrollDirection: Axis.horizontal,
            itemCount: contentList.length,
            itemBuilder: (BuildContext context, int index) {
              final Content content = contentList[index];
              return GetBuilder<AuthController>(
                builder: (val) => GestureDetector(
                  onTap: () {
                    // authRequest.getBearer();
                    Map<String, dynamic> payload = generatePayload();
                    print('from deals');
                    // print(val.data.toString());
                    val.runClickPredModel(val.data['access_token'].toString(), payload);
                    print(content.name);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 130.0,
                        width: 130.0,
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(content.imageUrl),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: content.color,
                            width: 2.0,
                          ),
                        ),
                      ),
                      Container(
                        height: 130.0,
                        width: 130.0,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Colors.black87,
                              Colors.black45,
                              Colors.transparent,
                            ],
                            stops: [0, 0.25, 1],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(color: content.color, width: 4.0),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 60,
                        child: SizedBox(
                          height: 15.0,
                          child: Text(
                            content.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 9.0,
                                fontWeight: FontWeight.bold),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Map<String, dynamic>generatePayload() {
    Random randX = Random();
    int index = randX.nextInt(3);
    return clickPredData[index];
  }
}
