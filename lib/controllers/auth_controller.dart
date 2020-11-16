import 'dart:convert';

import 'package:get/get.dart';
import 'package:omnikit/services/networking.dart';

import '../settings.dart';

class AuthController extends GetxController {
  dynamic data;
  String eMClickPredResponse;
  var fData = {
    'grant_type': '$masGrantType',
    'username': '$masUserName',
    'password': '$masPassword',
  };

  Future<dynamic> getBearer() async {
    NetworkHelper networkHelper = NetworkHelper('$clickPredictionMasAuthUrl');
    dynamic rData = await networkHelper.postDioData(fData);
    print(rData['access_token'].toString());
    data = rData;
    update();
    return data;
  }

  void runClickPredModel(
      String token, Map<String, dynamic> payload) async {
    NetworkHelper networkHelper = NetworkHelper('$clickPredictionScoringUrl');
    dynamic resultResponse =
        await networkHelper.getClickPrediction(token: token, payload: payload);
    dynamic jsonifiedEMResponse = jsonDecode(resultResponse);
    // print(jsonifiedResponse['outputs'][1]['value'].toString());
    // print(jsonifiedResponse['outputs'][4].toString());
    eMClickPredResponse = jsonifiedEMResponse['outputs'][1]['value'].toString();
    update();
    // return jsonifiedEMResponse['outputs'][1]['value'];
  }
}
