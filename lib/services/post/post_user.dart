import 'dart:async';
import 'dart:convert';

import '../../models/user.dart';
import 'package:http/http.dart' as http;

Future<String> postUser(User user) async {
  User u = new User(
    email: "'jakab.andrea@gmail.com'",
    username: "'csillagfeny'",
    password: "'654'",
    lastName: "'Jakab'",
    firstName: "'Andrea'",
  );

  try {
    final response = await http
        .post(
          Uri.parse('https://10.0.2.2:5001/user'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String?>{
            "Id": 1.toString(),
            "Email": user.email,
            "Username": user.username,
            "Password": user.password,
            "LastName": user.lastName,
            "FirstName": user.firstName,
          }),
        )
        .timeout(Duration(seconds: 2));

    return response.body;
  } on TimeoutException catch (_) {
    return 'TimeoutException';
  } on Exception catch (_) {
    return 'OtherException';
  }

  // if (response.statusCode == 201) {
  //   return User.fromJson(jsonDecode(response.body));
  // } else {
  //   throw Exception('Failed to create album.');
  // }
}
