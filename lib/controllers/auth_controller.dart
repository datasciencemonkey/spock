import 'package:get/get.dart';
import 'package:omnikit/services/networking.dart';

import '../settings.dart';

class AuthController extends GetxController {
  dynamic data;
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

  Future<dynamic> runClickPredModel(String token, Map<String,dynamic> payload) async {
    NetworkHelper networkHelper = NetworkHelper('$clickPredictionScoringUrl');
    dynamic resultResponse =
        await networkHelper.getClickPrediction(token: token, payload: payload);
    print(resultResponse.toString());
  }
}
