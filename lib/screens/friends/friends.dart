import 'dart:ui';

import 'package:finebooks_app/blocs/friends/friends_bloc.dart';
import 'package:finebooks_app/blocs/friends/friends_events.dart';
import 'package:finebooks_app/blocs/friends/friends_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './components/followers_page.dart';
import './components/following_page.dart';
import '../../theme/theme.dart';

import 'components/friends_page.dart';

class Friends extends StatelessWidget {
  PageController _pageController = PageController();
  int _selectedItem = 0;
  var _pages = [FriendsPage(), FollowingPage(), FollowersPage()];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var appWidth = mediaQuery.size.width;
    var appHeight =
        mediaQuery.size.height - MediaQueryData.fromWindow(window).padding.top;

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
