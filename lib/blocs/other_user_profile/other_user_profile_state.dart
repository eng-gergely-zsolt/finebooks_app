import 'package:finebooks_app/blocs/other_user_profile/other_user_profile_block.dart';
import 'package:finebooks_app/functions/simple_error_message.dart';
import 'package:finebooks_app/models/friend_request.dart';
import 'package:finebooks_app/services/post/post_friend_request.dart';
import 'package:flutter/cupertino.dart';

import 'other_user_profile_events.dart';
import 'package:finebooks_app/blocs/other_user_profile/other_user_profile_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtherUserProfileState {
  int? userId;
  final String userName;
  final bool friendRequestStatus;

  OtherUserProfileState({
    this.userId,
    this.userName = '',
    this.friendRequestStatus = false,
  });

  OtherUserProfileState newOtherUserProfileState({
    int? pUserId,
    int? pLoggedUserId,
    String? pUsername,
    BuildContext? pContext,
    bool? pFriendRequestStatus,
  }) {
    return OtherUserProfileState(
      userName: pUsername ?? this.userName,
      friendRequestStatus: pFriendRequestStatus ?? this.friendRequestStatus,
    );
  }

  bool get getFriendRequestStatus {
    return this.friendRequestStatus;
  }

  void sendFriendRequest(
      int? userId, int? loggedUserId, BuildContext? context) {
    if (userId != null && context != null && loggedUserId != null) {
      FriendRequest friendRequest = new FriendRequest(
        senderId: loggedUserId,
        receiverId: userId,
        isAccepted: 0,
      );

      Future<String> response = postFriendRequest(friendRequest);

      response.then(
        (value) {
          if (value == 'TimeoutException') {
            String message =
                'Somthing is wrong, please check you network connection';
            simpleErrorMessage(context, message);
          }
          //Other exception
          else if (value == 'OtherException') {
            String message = 'Other exception';
            simpleErrorMessage(context, message);
          }
          //Friend request sent successfully
          else if (value == "\"Friend request sent successfully\"") {
            context.read<OtherUserProfileBloc>().add(
                  SetFriendRequestStatus(),
                );
          }
        },
      );
    }
  }
}
