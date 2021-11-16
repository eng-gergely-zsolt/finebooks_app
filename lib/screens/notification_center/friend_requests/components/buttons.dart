import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/received_friend_request.dart';
import '../../../../blocs/friend_requests/friend_request_bloc.dart';
import '../../../../blocs/friend_requests/friend_request_events.dart';

class Buttons extends StatelessWidget {
  final ReceivedFriendRequest friendRequest;

  Buttons(this.friendRequest);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var appWidth = mediaQuery.size.width;
    var appHeight =
        mediaQuery.size.height - MediaQueryData.fromWindow(window).padding.top;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text('Confirm'),
          onPressed: () {
            context
                .read<FriendRequestBloc>()
                .add(ConfirmEvent(friendRequest.friendRequestId));
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.brown[400],
            fixedSize: Size(appWidth * 0.05, appHeight * 0.04),
            minimumSize: Size(appWidth * 0.25, appHeight * 0.04),
          ),
        ),
        SizedBox(width: appWidth * 0.03),
        ElevatedButton(
          child: Text('Delete'),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.black,
            primary: Color.fromRGBO(254, 251, 236, 1),
            fixedSize: Size(appWidth * 0.05, appHeight * 0.04),
            minimumSize: Size(appWidth * 0.25, appHeight * 0.04),
          ),
        ),
      ],
    );
  }
}
