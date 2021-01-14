import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String username = 'sas.ec';
String password = '';
String basicAuth = 'Basic ' + base64Encode(utf8.encode('sas.ec:'));

Map<String, String> postHeaders = <String, String>{'authorization': basicAuth};

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response =
        await http.get(url, headers: {'Accept': 'application/json'});
    if (response.statusCode == 200) {
      print(response.body);
//      xml2json.parse(response.body);
//      var jsonData = xml2json.toGData();
      var data = response.body;
//      var data = jsonDecode(jsonData);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future postData(dynamic payload) async {
    print(url);
    print('this is from postData');
    print(jsonEncode('grant_type=password&username=sagang&password=sas123'));
    print(postHeaders);
    http.Response response = await http.post(url,
        body: jsonEncode('grant_type=password&username=sagang&password=sas123'),
        headers: postHeaders);
    if (response.statusCode == 200) {
      String data = response.body;
      return data;
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> postDioData(Map fData) async {
    Dio dio = Dio();
    Response response = await dio.post(
      url,
      data: fData,
      options: Options(
          headers: postHeaders, contentType: Headers.formUrlEncodedContentType),
    );
    print(url);
    // print(fData.toString());
    if (response.statusCode == 200) {
      dynamic data = response.data;
      print(response.data.toString());
      print(response.statusCode);
      return data;
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getClickPrediction(
      {String token, Map<String, dynamic> payload}) async {
    Dio dio = Dio();
    Map<String, String> getHeaders = <String, String>{
      'Content-Type': "application/json",
      'authorization': "Bearer " + token
    };
    print(json.encode(payload));
    Response response = await dio.post(
      url,
      data: json.encode(payload),
      options: Options(headers: getHeaders),
    );
    print(url);
    print(getHeaders);
    if (response.statusCode == 201 || response.statusCode == 200) {
      dynamic data = response.data;
      print('MAS responded with Status code ${response.statusCode}');
      return data;
    } else {
      print('Request Failed.Contact your dev/admin');
    }
  }

  Future<dynamic> getFraudData({Map<String, dynamic> payload}) async {
    Dio dio = new Dio();
    Response response = await dio.post(
      url,
      data: json.encode(payload),
    );
    print(response.data.runtimeType);
    if (response.statusCode == 201 || response.statusCode == 200) {
      dynamic data = response.data;
      print('Endpoint responded with Status code ${response.statusCode}');
      return data;
    } else {
      print('Request Failed.Contact your dev/admin');
    }
  }

  Future<dynamic> getCognitiveServiceData({Map<String, dynamic> payload}) async {
    Dio dio = new Dio();
    Response response = await dio.post(
      url,
      data: json.encode(payload),
    options: Options(headers: {'Accept': 'application/json', 'Ocp-Apim-Subscription-Key':'fca0d344c4ca483b85d16515b9794d85'})
    );
    // print(response.data.runtimeType);
    if (response.statusCode == 201 || response.statusCode == 200) {
      dynamic data = response.data;
      print('Endpoint $url responded with Status code ${response.statusCode}');
      return data;
    } else {
      print('Request Failed.Contact your dev/admin');
    }
  }

}
