import 'package:finebooks_app/models/received_friend_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './friend_request_state.dart';
import '../../repositories/friend_requests_repository.dart';
import '../../blocs/friend_requests/friend_request_events.dart';

class FriendRequestBloc extends Bloc<FriendRequestEvent, FriendRequestState> {
  FriendRequestBloc() : super(InitialState());

  @override
  Stream<FriendRequestState> mapEventToState(FriendRequestEvent event) async* {
    final userRepository = FriendRequestsRepository();

    if (event is InitialEvent) {
      print('FAAAAAAAAAAASZ');
      final friendRequests =
          await userRepository.getFriendRequestsRepo(event.userId);
      yield LoadedState(friendRequests);
    }
    //
    else if (event is ConfirmEvent) {
      await userRepository.confirmFriendRequestRepo(event.friendRequestId);
      final List<ReceivedFriendRequest> friendRequests =
          List.from(state.getFriendRequests);
      friendRequests.removeWhere(
          (element) => element.friendRequestId == event.friendRequestId);
      if (friendRequests.length == 0) {
        yield state.newFriendRequestState(
          pFriendRequests: friendRequests,
          pIsFetchCompleted: true,
        );
      } else {
        yield state.newFriendRequestState(
          pFriendRequests: friendRequests,
        );
      }
    }
  }
}
