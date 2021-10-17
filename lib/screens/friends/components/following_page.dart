import 'package:flutter/material.dart';

import 'dart:ui';

import 'package:finebooks_app/blocs/friends/friends_bloc.dart';
import 'package:finebooks_app/blocs/friends/friends_events.dart';
import 'package:finebooks_app/blocs/friends/friends_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FollowingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var appWidth = mediaQuery.size.width;
    var appHeight =
        mediaQuery.size.height - MediaQueryData.fromWindow(window).padding.top;

    return Scaffold(
      body: Container(
        child: Center(child: Text('Following page')),
      ),
    );
  }
}
