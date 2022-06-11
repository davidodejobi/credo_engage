import 'dart:developer';

import 'api_token.dart';
import 'package:http/http.dart' as http;

connect(String endPoint) async {
  var url = Uri.parse('$baseUrl/$endPoint');

  String token = myToken;
  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  log('response status code: ${response.statusCode}');
  log('response body: ${response.body}');
  return response;
}
