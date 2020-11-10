import 'package:http/http.dart' as http;
import 'dart:convert';

const postHeaders = {"Content-Type":"application/json"};

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

  Future putData(dynamic payload) async {
    print(url);
    print(jsonEncode(payload));
    http.Response response = await http.put(url,
        body: jsonEncode(payload),
        headers: postHeaders);
    if (response.statusCode == 200) {
      String data = response.body;
      return data; 
    } else {
      print(response.statusCode);
    }
  }
}
