import 'package:finebooks_app/models/user.dart';

abstract class FriendsEvent {}

class SetValues extends FriendsEvent {
  final int? index;
  final User? user;
  SetValues({this.index, this.user});
}

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
