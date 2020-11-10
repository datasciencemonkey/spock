import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:omnikit/controllers/cart_products.dart';
import 'package:omnikit/controllers/customer_scores_model.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;

  const CustomAppBar({
    Key key,
    this.scrollOffset = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final String customerSegment =
    //     customerData['events'][1]['event']['segment'];
    // final String customerId = customerData['events'][1]['event']['user_id'];
    // final String openSourceProbChurn =
    //     customerData['events'][1]['event']['predict_value_y'];
    // final String probChurn = customerData['events'][1]['event']['P_CHURN1'];
    // final String probRetention = customerData['events'][1]['event']['P_CHURN0'];

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
            IconButton(
              icon: Icon(FontAwesomeIcons.userCircle),
              onPressed: () {
                Get.defaultDialog(
                  title: "SAS AI Customer Analysis",
                  // backgroundColor: Colors.tealAccent,
                  content: Container(
                    width: Get.width,
                    child: GetBuilder<CustomerScoresController>(
                      builder: (val) {
                        customerSegment = val.customerScoreData['events'][1]
                            ['event']['segment'];
                        customerId = val.customerScoreData['events'][1]['event']
                            ['user_id'];
                        openSourceProbChurn = val.customerScoreData['events'][1]
                            ['event']['predict_value_y'];
                        probChurn = val.customerScoreData['events'][1]['event']
                            ['P_CHURN1'];
                        probRetention = val.customerScoreData['events'][1]
                            ['event']['P_CHURN0'];
                        return Text(
                          'Customer ID : $customerId \nCustomer Segment: $customerSegment \nOpen Source Model Churn Score: ${double.parse(openSourceProbChurn).toStringAsFixed(2)}\nSASML Churn Score:${double.parse(probChurn).toStringAsFixed(2)}\nSASML Retention Score:${double.parse(probRetention).toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w300),
                        );
                      },
                    ),
                  ),
                );
                print(
                    '$customerId,$customerSegment,$openSourceProbChurn,$probChurn');
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
