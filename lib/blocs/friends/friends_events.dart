abstract class FriendsEvent {}

class SwitchPage extends FriendsEvent {
  final int index;
  SwitchPage(this.index);
}

class SetUserIndexInSearchResult extends FriendsEvent {
  final int userIndexInSearchResult;
  SetUserIndexInSearchResult(this.userIndexInSearchResult);
}

class SearchUsersByNameFragment extends FriendsEvent {
  final String? userNameFragment;
  SearchUsersByNameFragment({this.userNameFragment});
}
