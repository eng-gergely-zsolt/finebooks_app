import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/theme.dart';
import 'friend_requests/friend_requests.dart';
import '../friends/components/following_page.dart';
import '../../blocs/custom_notification/custom_notification_bloc.dart';
import '../../blocs/custom_notification/custom_notification_state.dart';
import '../../blocs/custom_notification/custom_notification_events.dart';

class NotificationCenter extends StatelessWidget {
  final int loggedUserId;

  NotificationCenter(this.loggedUserId);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var appWidth = mediaQuery.size.width;

    final _pages = [FollowingPage(), FollowingPage(), Requests(loggedUserId)];

    return MaterialApp(
      theme: CustomTheme.lightTheme,
      home: BlocProvider(
        create: (context) => CustomNotificationBloc(),
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Container(
                width: appWidth * 1,
                child: BlocBuilder<CustomNotificationBloc,
                    CustomNotificationState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        state.getIndex == 0
                            ? Text('NOTIFICATIONS')
                            : Opacity(
                                opacity: 0.5,
                                child: Text('NOTIFICATIONS'),
                              ),
                        state.getIndex == 1
                            ? Text('MESSAGES')
                            : Opacity(
                                opacity: 0.5,
                                child: Text('MESSAGES'),
                              ),
                        state.getIndex == 2
                            ? Text('REQUESTS')
                            : Opacity(
                                opacity: 0.5,
                                child: Text('REQUESTS'),
                              ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          body: BlocBuilder<CustomNotificationBloc, CustomNotificationState>(
            builder: (context, state) {
              return PageView(
                children: _pages,
                onPageChanged: (index) {
                  context.read<CustomNotificationBloc>().add(SwitchPage(index));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
