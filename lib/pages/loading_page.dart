import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:omnikit/controllers/customer_scores_model.dart';

import '../services/services.dart';
import 'landing_page.dart';
// import 'results_page.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({@required this.id, @required this.email});
  final String id;
  final String email;
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getChurnData(widget.id);
  }

  void getChurnData(String id) async {
    var churnData = await ChurnService().getCustomerScores(id); //json
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return GetBuilder<CustomerScoresController>(
        builder: (val) {
          val.addScores(churnData);
          return LandingPage(
            email: widget.email
          );
        },
      );
    }));
    // print(churnData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
