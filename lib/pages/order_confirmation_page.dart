import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:omnikit/controllers/cart_products.dart';
import 'package:omnikit/controllers/fraud_detection_controller.dart';
import 'package:omnikit/data/data.dart';

class OrderConfirmation extends StatelessWidget {
  final randGen = new Random();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [
            GetBuilder<FraudController>(
              init: FraudController(),
              builder: (val) => IconButton(
                  icon: Icon(FontAwesomeIcons.brain,
                      size: 30, color: Colors.black54),
                  tooltip: "Fraud Analysis",
                  onPressed: () {
                    // 1. Geneate an event - usually DB query
                    Map<String, dynamic> payload = generateEvent();
                    print(payload);
                    //2. Send the payload to scoring service
                    val.runFraudPredModel(payload);
                    Future.delayed(
                      Duration(milliseconds: 500),
                      () => Get.defaultDialog(
                        backgroundColor: Colors.blue,
                        title: '🚀 SAS AI Fraud Analysis',
                        titleStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        content: Column(
                          children: [
                            Text(
                                'Fraud Anomaly (0/1) → ${val.fraudAnomalyPredResponse}',
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                            SizedBox(height: 20),
                            Text('Anomaly Score → ${val.data['Anomaly_Score']}',
                                style: TextStyle(
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            GetBuilder<UserCartProductsController>(builder: (val) {
              return IconButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  val.emptyCart();
                },
                icon: Icon(Icons.logout, size: 30, color: Colors.black54),
              );
            }),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Icon(FontAwesomeIcons.boxOpen,
                  size: 100.0, color: Colors.amberAccent),
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
        // bottomNavigationBar: CurvedNavigationBar(
        //   color: Colors.blue,
        //   animationCurve: Curves.decelerate,
        //   height: 50,
        //   backgroundColor: Colors.blue,
        //   items: <Widget>[
        //     Icon(Icons.check_box, size: 30),
        //     Icon(Icons.compare_arrows, size: 30),
        //   ],
        //   onTap: (index) {
        //     print(index);
        //     //Handle button tap
        //   },
        // ),
      ),
    );
  }
}

Map<String, dynamic> generateEvent() {
  Random randx = Random();
  return fraudPredData[randx.nextInt(3)];
}
