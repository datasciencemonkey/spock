import 'package:http/http.dart' as http;
import 'dart:convert';

String username = 'sas.ec';
String password = '';
String basicAuth =
      'Basic ' + base64Encode(utf8.encode('sas.ec:'));

Map<String, String> postHeaders = <String,String>{
  'Content-Type': "application/x-www-form-urlencoded",
  'authorization': basicAuth
};

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    print(url);
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
}