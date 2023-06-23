import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiRequests {
  Future<dynamic> get(
      {required String url, Map<String, String>? headers}) async {
    http.Response response =
        await http.get(Uri.parse(url), headers: headers ?? {});

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url,
      required Map<String, dynamic> body,
      String? token}) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsonString = jsonEncode(body);
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
        
      });
    }
    http.Response response =
        await http.post(Uri.parse(url), body: jsonString, headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }
}
