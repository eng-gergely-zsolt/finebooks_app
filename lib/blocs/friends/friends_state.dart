import '../../models/user.dart';
import '../../services/get/get_users_by_name_fragment.dart';

class FriendsState {
  int index;
  final int userIndexInSearchResult;

  final String userNameFragment;

  User? user;

  List<User>? users;

  FriendsState({
    this.user,
    this.users,
    this.index = 100,
    this.userNameFragment = '',
    this.userIndexInSearchResult = 0,
  });

  FriendsState newFriendsState({
    User? pUser,
    int? pIndex,
    int? pUserIndexInSearchResult,
    String? pUserNameFragment,
  }) {
    return FriendsState(
      users: this.users,
      user: pUser ?? this.user,
      index: pIndex ?? this.index,
      userNameFragment: pUserNameFragment ?? this.userNameFragment,
      userIndexInSearchResult:
          pUserIndexInSearchResult ?? this.userIndexInSearchResult,
    );
  }

  void setUser(User pUser) {
    this.user = pUser;
  }

  void setIndex(int pIndex) {
    this.index = pIndex;
  }

  int get getIndex {
    return this.index;
  }

  User? get getUser {
    return this.user;
  }

  int get getUserIndexInSearchResult {
    return this.userIndexInSearchResult;
  }

  List<User> get getUsers {
    List<User> result = [];

    if (this.users != null) {
      result = List.from(this.users!);
    }
    return result;
  }

  void searchUsersByNameFragment(String? pUserNameFragment) {
    if (pUserNameFragment != null) {
      Future<List<User>> response = fetchUsersByNameFragment(pUserNameFragment);

      response.then((value) {
        this.users = List.from(value);
      });
    }
  }
}
