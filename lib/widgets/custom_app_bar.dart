import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:omnikit/controllers/cart_products.dart';
import 'package:omnikit/controllers/customer_scores_model.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  final dynamic customerData;

  const CustomAppBar({
    Key key,
    this.scrollOffset = 0.0,
    this.customerData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String customerSegment;
    String customerId;
    String openSourceProbChurn;
    String probChurn;
    String probRetention;

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
            GetBuilder<CustomerScoresController>(
              init: CustomerScoresController(),
              builder: (val) {
                if (customerData != null) {
                  val.addScores(customerData);
                  customerSegment =
                      customerData['events'][1]['event']['segment'];
                  customerId = customerData['events'][1]['event']['user_id'];

                  openSourceProbChurn =
                      customerData['events'][1]['event']['predict_value_y'];
                  probChurn = customerData['events'][1]['event']['P_CHURN1'];
                  probRetention =
                      customerData['events'][1]['event']['P_CHURN0'];
                } else {
                  // print(val.customerScoreData['events'][1]['event']['segment']);
                  customerSegment =
                      val.customerScoreData['events'][1]['event']['segment'];
                  customerId =
                      val.customerScoreData['events'][1]['event']['user_id'];
                  openSourceProbChurn = val.customerScoreData['events'][1]
                      ['event']['predict_value_y'];
                  probChurn =
                      val.customerScoreData['events'][1]['event']['P_CHURN1'];
                  probRetention =
                      val.customerScoreData['events'][1]['event']['P_CHURN0'];
                }
                return IconButton(
                  icon: Icon(FontAwesomeIcons.userCircle),
                  onPressed: () {
                    Get.defaultDialog(
                      backgroundColor: Colors.blueAccent,
                      title: "💡SAS AI Customer Analysis",
                      titleStyle: TextStyle(color: Colors.white,),
                      // backgroundColor: Colors.tealAccent,
                      content: Container(
                        // color: Colors.blueAccent,
                        width: Get.width,
                        child: Text(
                          'Customer ID : $customerId \nCustomer Segment: $customerSegment \nOpen Source Churn Score: ${double.parse(openSourceProbChurn).toStringAsFixed(2)}\nSASML Churn Score:${double.parse(probChurn).toStringAsFixed(2)}\nSASML Retention Score:${double.parse(probRetention).toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.white,
                              fontSize: 16.0, fontWeight: FontWeight.w300),
                        ),
                      ),
                    );
                    print(
                        '$customerId,$customerSegment,$openSourceProbChurn,$probChurn');
                  },
                );
              },
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
