import 'dart:convert';

import 'package:http/http.dart' as http;

class RestService {
  final String _baseUrl;
  final String _keys;

  const RestService({required baseUrl, required keys})
      : _baseUrl = baseUrl,
        _keys = keys;

  Future get(String endPoint) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/$endPoint'),
      headers: {
        'Authorization': _keys,
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response.statusCode;
  }
}
