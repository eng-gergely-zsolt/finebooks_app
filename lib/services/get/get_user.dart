import 'dart:convert';

import '../../models/user.dart';
import 'package:http/http.dart' as http;

Future<List<User>> fetchUserByUsername(String username) async {
  String uri = '';

  if (username == '') {
    return [];
  } else {
    uri = 'https://10.0.2.2:5001/user' + '/$username';
  }

  final response = await http.get(Uri.parse(uri));

  if (response.statusCode == 200) {
    Iterable list = json.decode(response.body);
    return list.map((model) => User.fromJson(model)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}
