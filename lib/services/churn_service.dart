import 'networking.dart';
import '../settings.dart';


class ChurnService {
  Future<dynamic> getCustomerScores(String id) async {
    NetworkHelper networkHelper =
        NetworkHelper('$espChurnModelUrl?filter=in(user_id,$id)');
    var customerChurnData = await networkHelper.getData();
    // print(customerChurnData);
    return customerChurnData;
  }
}
