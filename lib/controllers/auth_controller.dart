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
    dynamic data = await networkHelper.postDioData(fData);
    print(data['access_token'].toString());
    return data;
  }
}
