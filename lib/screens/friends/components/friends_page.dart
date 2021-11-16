import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/user.dart';
import '../../../blocs/friends/friends_bloc.dart';
import '../../../blocs/friends/friends_state.dart';
import '../../../blocs/friends/friends_events.dart';
import '../../other_user_profile/other_user_profile.dart';

class FriendsPage extends StatelessWidget {
  final User loggedInUser;

  FriendsPage(this.loggedInUser);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var appHeight =
        mediaQuery.size.height - MediaQueryData.fromWindow(window).padding.top;

    return Scaffold(
      floatingActionButton: Padding(
        padding:
            EdgeInsets.only(bottom: appHeight * 0.02, right: appHeight * 0.02),
        child: BlocBuilder<FriendsBloc, FriendsState>(
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () => showSearch(
                context: context,
                delegate: DataSearch(context, state, loggedInUser),
              ),
              backgroundColor: Colors.brown,
              child: Icon(Icons.person_add_sharp),
            );
          },
        ),
      ),
      body: Container(
        child: Center(child: Text('Friends page')),
      ),
    );
  }
}

class DataSearch extends SearchDelegate {
  User loggedInUser;
  BuildContext ctx;
  FriendsState state;

  DataSearch(this.ctx, this.state, this.loggedInUser);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final user = state.getUser;
    return OtherUserProfile(user, loggedInUser);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    ctx
        .read<FriendsBloc>()
        .add(SearchUsersByNameFragment(userNameFragment: query));

    state.searchUsersByNameFragment(query);
    List<User> mySuggestionList = List.from(state.getUsers);

    return ListView.builder(
      itemCount: mySuggestionList.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.person),
        onTap: () {
          state.setUser(mySuggestionList[index]);
          showResults(context);
        },
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              (mySuggestionList[index].lastName) +
                  (mySuggestionList[index].firstName),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
