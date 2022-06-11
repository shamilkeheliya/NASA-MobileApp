import 'dart:convert';

import 'package:http/http.dart' as http;

class API {
  getData(url) async {
    http.Response response = await http.get(url);
    return jsonDecode(response.body);
  }
}
