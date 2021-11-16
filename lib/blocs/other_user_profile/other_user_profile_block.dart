import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/other_user_profile/other_user_profile_events.dart';
import '../../blocs/other_user_profile/other_user_profile_state.dart';

class OtherUserProfileBloc
    extends Bloc<OtherUserProfileEvent, OtherUserProfileState> {
  OtherUserProfileBloc() : super(OtherUserProfileState());

  @override
  Stream<OtherUserProfileState> mapEventToState(
      OtherUserProfileEvent event) async* {
    //Set friend request status
    if (event is SetFriendRequestStatus) {
      yield state.newOtherUserProfileState(
        pFriendRequestStatus: event.friendRequestStatus,
      );
    }
    //Change input
    if (event is ChangeInput) {
      yield state.newOtherUserProfileState(
        pUsername: event.username,
      );
    }
    //Change input
    if (event is SendFriendRequest) {
      yield state.newOtherUserProfileState(
        pUserId: event.userId,
        pContext: event.context,
        pLoggedUserId: event.loggedUserId,
      );
    }
  }
}
