import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/relationship.dart';

Future<List<Relationship>> fetchRelationshipsById(int? userId) async {
  String uri = '';
  List<Relationship> result = [];

  if (userId != null) {
    if (userId < 0) {
      // Do nothing
    }
    // Lenth bigger than 3
    else {
      uri = 'https://10.0.2.2:5001/relationship' + '/$userId';
      http.Response response;

      try {
        response = await http.get(Uri.parse(uri)).timeout(Duration(seconds: 2));

        if (response.statusCode == 200) {
          Iterable list = json.decode(response.body);
          result = list.map((model) => Relationship.fromJson(model)).toList();
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
  }

  return result;
}
