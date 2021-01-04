// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:omnikit/services/backend_auth_service.dart';
// import 'package:get/get.dart';
// import 'package:omnikit/controllers/customer_scores_model.dart';

import '../services/services.dart';
import 'landing_page.dart';
// import 'results_page.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen(
      {@required this.id, @required this.email, @required this.isSwitched});
  final String id;
  final String email;
  final bool isSwitched;
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  dynamic churnData;

  @override
  void initState() {
    super.initState();
    getChurnData(widget.id);
  }

  void getChurnData(String id) async {
    var churnData = await ChurnService().getCustomerScores(id); //json
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LandingPage(
        email: widget.email,
        data: churnData,
        isSwitched: widget.isSwitched,
      );
    }));
    // print(churnData);
  }

//Not needed here

  // Future<Response> getMasAuthData() async {
  //   Response response = await BackEndAuthService().getBearer();
  //   return response;
  // }

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
