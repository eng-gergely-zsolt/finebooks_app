import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../../services/get/get_users_by_name_fragment.dart';
import '../../screens/friends/components/friends_page.dart';
import '../../screens/friends/components/followers_page.dart';
import '../../screens/friends/components/following_page.dart';

class FriendsState {
  final int index;
  final int userIndexInSearchResult;

  final String userNameFragment;

  List<User>? users;
  final pages = [FriendsPage(), FollowingPage(), FollowersPage()];

  FriendsState({
    this.users,
    this.index = 0,
    this.userNameFragment = '',
    this.userIndexInSearchResult = 0,
  });

  FriendsState newFriendsState({
    int? pIndex,
    int? pUserIndexInSearchResult,
    String? pUserNameFragment,
  }) {
    return FriendsState(
      users: this.users,
      index: pIndex ?? this.index,
      userNameFragment: pUserNameFragment ?? this.userNameFragment,
      userIndexInSearchResult:
          pUserIndexInSearchResult ?? this.userIndexInSearchResult,
    );
  }

  int get getIndex {
    return this.index;
  }

  int get getUserIndexInSearchResult {
    return this.userIndexInSearchResult;
  }

  Widget getPageByIndex(int index) {
    return pages[index];
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
