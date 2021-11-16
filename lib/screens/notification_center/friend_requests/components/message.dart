import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../models/received_friend_request.dart';

class Message extends StatelessWidget {
  final int index;
  final List<ReceivedFriendRequest> users;

  Message(this.index, this.users);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var appWidth = mediaQuery.size.width;
    var appHeight =
        mediaQuery.size.height - MediaQueryData.fromWindow(window).padding.top;

    return Container(
      child: Row(
        children: [
          SizedBox(width: appWidth * 0.02),
          Text(
            users[index].senderFirstName + ' ' + users[index].senderLastName,
            style: TextStyle(
              fontSize: appHeight * 0.019,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            ' sent you a frind request.',
            style: TextStyle(
              fontSize: appHeight * 0.019,
            ),
          ),
        ],
      ),
    );
  }
}
