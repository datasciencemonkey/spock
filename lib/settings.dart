// ESP Churn Prediction project- Provides 3 models
// ---> Open Source Python, SAS ASTORE & Online Streaming only model
import 'dart:io';

const churnEspHostName =
    'http://espsixone.dlviyacluster.sashq-r.openstack.sas.com';
const churnEspHttpPort = 60001;
const churnESPProjectName = 'churn_detection_exp_py';
const churnESPSubscribeFromWindow = 'resultSet';
const espChurnModelUrl =
    '$churnEspHostName:$churnEspHttpPort/SASESP/events/$churnESPProjectName/cq1/$churnESPSubscribeFromWindow';

// Click Through Prediction for Promo Items - Setting to Post Payload
const clickPredictionMasHost = 'http://ccbu-viya35.aws.sas.com';
const clickPredictionMasModule = 'click_pred_autosas';
const clickPredictionScoringUrl =
    '$clickPredictionMasHost/microanalyticScore/modules/$clickPredictionMasModule/steps/score';
const clickPredictionMasAuthUrl =
    '$clickPredictionMasHost/SASLogon/oauth/token';
const masGrantType = 'password';
const masUserName = 'sagang';
const masPassword = 'sas123';

// fraud Scoring - for Anomaly Detection
bool isAndroid() {
  return Platform.isAndroid;
}

String fraudServiceHost =
    isAndroid() ? 'http://10.0.2.2:8001' : 'http://localhost:80001';
const fraudServiceName = 'fraudAnomaly';
String fraudServiceUrl = '$fraudServiceHost/$fraudServiceName/';

//azure cognitive services
const cognitiveSentimentEndpoint =
    'https://eastus.api.cognitive.microsoft.com/text/analytics/v2.1/sentiment';

const cognitiveLanguageEndpoint =
    'https://eastus.api.cognitive.microsoft.com/text/analytics/v2.1/languages';

const cognitiveKeyPhrasesEndpoint =
    'https://eastus.api.cognitive.microsoft.com/text/analytics/v2.1/keyPhrases';

const cognitiveEntitiesEndpoint =
    'https://eastus.api.cognitive.microsoft.com/text/analytics/v2.1/entities';
