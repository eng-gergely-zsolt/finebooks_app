import 'package:flutter/cupertino.dart';

abstract class OtherUserProfileEvent {}

class SetFriendRequestStatus extends OtherUserProfileEvent {
  final bool friendRequestStatus = true;
}

class ChangeInput extends OtherUserProfileEvent {
  final String? username;
  final String? password;
  ChangeInput({this.username, this.password});
}

class SendFriendRequest extends OtherUserProfileEvent {
  final int? userId;
  final int? loggedUserId;
  final BuildContext? context;
  SendFriendRequest({
    this.userId,
    this.context,
    this.loggedUserId,
  });
}
