import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import '../../models/book.dart';
import 'package:http/http.dart' as http;

Future<List<Book>> fetchBookByTitleFragment(String titleFragment) async {
  String uri = '';
  List<Book> result = [];

  if (titleFragment.length <= 3) {
    // Do nothing
  }
  // Lenth bigger than 3
  else {
    uri = 'https://10.0.2.2:5001/book' + '/$titleFragment';
    Response response;

    try {
      response = await http.get(Uri.parse(uri)).timeout(Duration(seconds: 2));

      if (response.statusCode == 200) {
        Iterable list = json.decode(response.body);
        result = list.map((model) => Book.fromJson(model)).toList();
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
