import 'networking.dart';
import '../settings.dart';

class BackEndAuthService {
  dynamic payload = <String, String>{
    'grant_type': '$masGrantType',
    'username': '$masUserName',
    'password': '$masPassword',
  };
  Future<dynamic> getBearer() async {
    NetworkHelper networkHelper = NetworkHelper('$clickPredictionMasAuthUrl');
    var response = await networkHelper.postData(payload);
    print(response);
    return response;
  }
}
