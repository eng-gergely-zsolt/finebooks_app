import 'package:equatable/equatable.dart';

import '../../models/received_friend_request.dart';

class FriendRequestState extends Equatable {
  final bool isFetchCompleted;
  final List<ReceivedFriendRequest> friendRequests;

  FriendRequestState({
    this.isFetchCompleted = false,
    required this.friendRequests,
  });

  FriendRequestState newFriendRequestState({
    bool? pIsFetchCompleted,
    List<ReceivedFriendRequest>? pFriendRequests,
  }) {
    return FriendRequestState(
      friendRequests: pFriendRequests ?? this.friendRequests,
      isFetchCompleted: pIsFetchCompleted ?? this.isFetchCompleted,
    );
  }

  bool get getIsFetchCompleted {
    return this.isFetchCompleted;
  }

  List<ReceivedFriendRequest> get getFriendRequests {
    return this.friendRequests;
  }

  List<Object> get props => [this.friendRequests];
}

class InitialState extends FriendRequestState {
  InitialState() : super(friendRequests: [], isFetchCompleted: false);
}

class LoadedState extends FriendRequestState {
  LoadedState(receivedFriendRequests)
      : super(friendRequests: receivedFriendRequests, isFetchCompleted: true);
}
