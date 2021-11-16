import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../models/received_friend_request.dart';

Future<List<ReceivedFriendRequest>> getFriendRequests(int userId) async {
  String uri = 'https://10.0.2.2:5001/friendrequest' + '/$userId';

  final response = await http.get(Uri.parse(uri));

  if (response.statusCode == 200) {
    Iterable list = json.decode(response.body);
    return list.map((model) => ReceivedFriendRequest.fromJson(model)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}
