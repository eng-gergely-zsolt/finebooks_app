import 'dart:ui';

import 'package:flutter/material.dart';

import './buttons.dart';
import './message.dart';
import '../../../../models/received_friend_request.dart';
import '../../../../blocs/friend_requests/friend_request_state.dart';

class RequestList extends StatelessWidget {
  final FriendRequestState state;
  final List<ReceivedFriendRequest> friendRequests;

  RequestList(this.state, this.friendRequests);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var appWidth = mediaQuery.size.width;
    var appHeight =
        mediaQuery.size.height - MediaQueryData.fromWindow(window).padding.top;

    return ListView.builder(
      itemCount: state.getFriendRequests.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: appWidth * 0.15,
                    height: appHeight * 0.1,
                    child: CircleAvatar(
                      radius: appHeight * 0.04,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          NetworkImage(friendRequests[index].senderImage),
                    ),
                  ),
                  Container(
                    width: appWidth * 0.78,
                    height: appHeight * 0.1,
                    child: Column(
                      children: [
                        Message(index, friendRequests),
                        Buttons(friendRequests[index]),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
