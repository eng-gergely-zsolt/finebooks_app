import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../models/friend_request.dart';

Future<String> postFriendRequest(FriendRequest friendRequest) async {
  try {
    final response = await http
        .post(
          Uri.parse('https://10.0.2.2:5001/friendrequest'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, int?>{
            "SenderId": friendRequest.senderId,
            "ReceiverId": friendRequest.receiverId,
            "IsAccepted": friendRequest.isAccepted,
          }),
        )
        .timeout(Duration(seconds: 2));

    return response.body;
  } on TimeoutException catch (_) {
    return 'TimeoutException';
  } on Exception catch (_) {
    return 'OtherException';
  }
}
