import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './components/request_list.dart';
import '../../../blocs/friend_requests/friend_request_bloc.dart';
import '../../../blocs/friend_requests/friend_request_state.dart';
import '../../../blocs/friend_requests/friend_request_events.dart';

class Requests extends StatelessWidget {
  final int thisUserId;

  Requests(this.thisUserId);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var appWidth = mediaQuery.size.width;
    var appHeight =
        mediaQuery.size.height - MediaQueryData.fromWindow(window).padding.top;

    return BlocProvider(
      create: (context) => FriendRequestBloc()..add(InitialEvent(thisUserId)),
      child: BlocBuilder<FriendRequestBloc, FriendRequestState>(
        builder: (context, state) {
          final friendRequests = state.getFriendRequests;
          final isFetchCompleted = state.getIsFetchCompleted;

          if (friendRequests.isEmpty && isFetchCompleted == false) {
            return Container(
              alignment: Alignment.center,
              child: FittedBox(child: CircularProgressIndicator()),
            );
          } else if (friendRequests.isEmpty && isFetchCompleted == true) {
            return Center(
                child: Text(
              'There is no friend request to show',
              style: TextStyle(fontSize: appHeight * 0.025),
            ));
          } else {
            return Padding(
              padding: EdgeInsets.only(
                  left: appWidth * 0.02,
                  right: appWidth * 0.02,
                  top: appHeight * 0.01),
              child: RequestList(state, state.getFriendRequests),
            );
          }
        },
      ),
    );
  }
}
