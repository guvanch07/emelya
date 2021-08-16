import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class UserDataPost with ChangeNotifier {
  final httpClient = http.Client();
  List<dynamic>? todoData;

  Map<String, String> customHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json; charset=UTF-8"
  };

//get requests after post requests
  Future fetchData() async {
    final Uri apiUrl = Uri.parse('api');
    http.Response response = await httpClient.get(apiUrl);
    final Map parsedData = await json.decode(response.body.toString());
    todoData = parsedData['Data'];
    print(todoData);
  }

  // Post requests
  Future addData(Map<String, dynamic> body) async {
    final Uri apiUrl = Uri.parse('http://todoflutternodejs.herokuapp.com/add');

    http.Response response = await httpClient.post(apiUrl,
        headers: customHeaders, body: jsonEncode(body));

    return response.body;
  }
}
