import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/user.dart';

Future<List<User>> fetchUsersByNameFragment(String nameFragment) async {
  String uri = '';
  List<User> result = [];

  if (nameFragment.length <= 3) {
    // Do nothing
  }
  // Lenth bigger than 3
  else {
    uri = 'https://10.0.2.2:5001/user/namefragment' + '/$nameFragment';
    http.Response response;

    try {
      response = await http.get(Uri.parse(uri)).timeout(Duration(seconds: 2));

      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        result = list.map((model) => User.fromJson(model)).toList();
      }
      // Statuscode is not 200
      else {
        throw Exception('Failed to fetch books');
      }
    }
    // Timeout exception
    on TimeoutException {
      return [];
    }
  }
  return result;
}
