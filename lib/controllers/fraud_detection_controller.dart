
import 'package:get/get.dart';
import 'package:omnikit/services/networking.dart';

import '../settings.dart';

class FraudController extends GetxController {
  dynamic data;
  String fraudAnomalyPredResponse;

  void runFraudPredModel(Map<String, dynamic> payload) async {
    NetworkHelper networkHelper = NetworkHelper('$fraudServiceUrl');
    dynamic resultResponse = await networkHelper.getFraudData(payload: payload);
    // print(resultResponse['outputs'][1]['value'].toString());
    // print(resultResponse['outputs'][4].toString());
    print(resultResponse.toString());
    data = resultResponse;
    fraudAnomalyPredResponse = resultResponse['Anomaly'].toString();
    update();
    // return resultResponse['outputs'][1]['value'];
  }
}
