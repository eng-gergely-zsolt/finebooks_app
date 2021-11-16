import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/theme.dart';
import '../../models/user.dart';
import './components/friends_page.dart';
import './components/followers_page.dart';
import './components/following_page.dart';
import '../../blocs/friends/friends_bloc.dart';
import '../../blocs/friends/friends_state.dart';
import '../../blocs/friends/friends_events.dart';

class Friends extends StatelessWidget {
  final User user;

  Friends(this.user);

  @override
  Widget build(BuildContext context) {
    final _pages = [FriendsPage(user), FollowingPage(), FollowersPage()];

    var mediaQuery = MediaQuery.of(context);
    var appWidth = mediaQuery.size.width;

    return MaterialApp(
      theme: CustomTheme.lightTheme,
      home: BlocProvider(
        create: (context) => FriendsBloc(),
        child: BlocBuilder<FriendsBloc, FriendsState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                actions: [
                  Container(
                    width: appWidth * 1,
                    child: BlocBuilder<FriendsBloc, FriendsState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            state.getIndex == 0
                                ? Text('FRIENDS')
                                : Opacity(
                                    opacity: 0.5,
                                    child: Text('FRIENDS'),
                                  ),
                            state.getIndex == 1
                                ? Text('FOLLOWING')
                                : Opacity(
                                    opacity: 0.5,
                                    child: Text('FOLLOWING'),
                                  ),
                            state.getIndex == 2
                                ? Text('FOLLOWERS')
                                : Opacity(
                                    opacity: 0.5,
                                    child: Text('FOLLOWERS'),
                                  ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              body: BlocBuilder<FriendsBloc, FriendsState>(
                builder: (context, state) {
                  return PageView(
                    children: _pages,
                    onPageChanged: (index) {
                      context.read<FriendsBloc>().add(SwitchPage(index));
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
