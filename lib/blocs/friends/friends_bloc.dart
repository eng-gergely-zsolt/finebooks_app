import 'package:flutter_bloc/flutter_bloc.dart';

import './friends_events.dart';
import './friends_state.dart';

class FriendsBloc extends Bloc<FriendsEvent, FriendsState> {
  FriendsBloc() : super(FriendsState());

  @override
  Stream<FriendsState> mapEventToState(FriendsEvent event) async* {
    // Switch pages on friends page
    if (event is SwitchPage) {
      yield state.newFriendsState(pIndex: event.index);
    }
    // Set user index in search result
    else if (event is SetUserIndexInSearchResult) {
      yield state.newFriendsState(
          pUserIndexInSearchResult: event.userIndexInSearchResult);
    }
    // Search users by name fragment
    else if (event is SearchUsersByNameFragment) {
      yield state.newFriendsState(pUserNameFragment: event.userNameFragment);
    }
  }
}
