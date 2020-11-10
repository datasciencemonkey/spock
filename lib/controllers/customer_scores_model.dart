import 'package:get/get.dart';

class CustomerScoresController extends GetxController {
  dynamic _customerScoreData;

  dynamic get customerScoreData {
    return _customerScoreData;
  }

  void addScores(dynamic customerScoreData) {
    _customerScoreData = customerScoreData;
    update();
  }

  // String get customerSegment => _customerSegment;
  // String get customerId => _customerId;
  // String get openSourceProbChurn => _openSourceProbChurn;
  // String get probRetention => _probRetention;
  // String get probChurn => _probChurn;

//   setCustomerSegment(String customerId) =>
//       _customerSegment = customerId;

//   setCustomerId(dynamic customerData) =>
//       _customerId = customerData['events'][1]['event']['user_id'];

//   setOpenSourceProbChurn(dynamic customerData) => _openSourceProbChurn =
//       customerData['events'][1]['event']['predict_value_y'];

//   setProbChurn(dynamic customerData) => _probChurn = customerData['events'][1]['event']['P_CHURN1'];

//  setProbRetention(dynamic customerData) => _probRetention = customerData['events'][1]['event']['P_CHURN0'];

}
