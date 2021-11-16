abstract class FriendRequestEvent {}

class InitialEvent extends FriendRequestEvent {
  final int userId;
  InitialEvent(this.userId);
}

class ConfirmEvent extends FriendRequestEvent {
  final int friendRequestId;
  ConfirmEvent(this.friendRequestId);
}
