import 'networking.dart';
import '../settings.dart';

class ReviewService {
  dynamic data;

  Future<dynamic> runTextAnalysisforLanguageDetection(
      Map<String, dynamic> payload) async {
    NetworkHelper networkHelper = NetworkHelper('$cognitiveLanguageEndpoint');
    dynamic resultResponse =
        await networkHelper.getCognitiveServiceData(payload: payload);
    // print(resultResponse.toString());
    return resultResponse;
  }

  Future<dynamic> runTextAnalysisforSentimentAnalysis(
      Map<String, dynamic> payload) async {
    NetworkHelper networkHelper = NetworkHelper('$cognitiveSentimentEndpoint');
    dynamic resultResponse =
        await networkHelper.getCognitiveServiceData(payload: payload);

    return resultResponse;
  }
  Future<dynamic> runTextAnalysisforKeyPhraseAnalysis(
      Map<String, dynamic> payload) async {
    NetworkHelper networkHelper = NetworkHelper('$cognitiveKeyPhrasesEndpoint');
    dynamic resultResponse =
        await networkHelper.getCognitiveServiceData(payload: payload);

    return resultResponse;
  }
  Future<dynamic> runTextAnalysisforEntityAnalysis(
      Map<String, dynamic> payload) async {
    NetworkHelper networkHelper = NetworkHelper('$cognitiveEntitiesEndpoint');
    dynamic resultResponse =
        await networkHelper.getCognitiveServiceData(payload: payload);

    return resultResponse;
  }
}
