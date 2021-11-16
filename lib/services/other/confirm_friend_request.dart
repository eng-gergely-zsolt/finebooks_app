import 'package:http/http.dart' as http;

Future<void> confirmFriendRequest(int friendRequestId) async {
  String uri =
      'https://10.0.2.2:5001/friendrequest/confirm' + '/$friendRequestId';

  await http.get(Uri.parse(uri));
}
