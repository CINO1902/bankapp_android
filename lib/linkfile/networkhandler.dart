import 'dart:async';
import 'dart:io';

import "package:http/http.dart" as http;

class networkHandler {
  static final client = http.Client();

  static Future<dynamic> post(var body, String endpoint) async {
    try {
      var response = await client.post(
          builderUrl(
            endpoint,
          ),
          body: body,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          });
      return response.body;
    } catch (e) {
      // print(e.toString());
    }
  }

  static Future<dynamic> get(String endpoint, String? token) async {
    try {
      var response = await client.get(
          builderUrl(
            endpoint,
          ),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'authorization': 'Bearer $token'
          });
      return response;
    } catch (e) {
      print(e.toString());
    }
  }

  static Uri builderUrl(String endpoint) {
    String host = "https://bankapp321.herokuapp.com/route";
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }

  static Future<String?> getToken() async {}
}
