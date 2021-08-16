import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class DataProduct with ChangeNotifier {
  Map<String, dynamic> _map = {};
  bool _error = false;
  String _errorMassage = '';

  Map<String, dynamic> get map => _map;
  bool get error => _error;
  String get errorMassage => _errorMassage;

  Future<void> get fetchData async {
    final response = await http.get(Uri.parse('api'));

    if (response.statusCode == 200) {
      try {
        _map = jsonDecode(response.body);
        _error = false;
      } catch (e) {
        _error = true;
        _errorMassage = e.toString();
        _map = {};
      }
    } else {
      _error = true;
      _errorMassage = "нет соеденение с интернетом";
      _map = {};
    }
    notifyListeners();
  }

  void initialValues() {
    _map = {};
    _error = false;
    _errorMassage = '';
    notifyListeners();
  }
}
