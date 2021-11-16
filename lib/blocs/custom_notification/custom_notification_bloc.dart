import 'package:flutter_bloc/flutter_bloc.dart';

import './custom_notification_state.dart';
import './custom_notification_events.dart';

class CustomNotificationBloc
    extends Bloc<CustomNotificationEvents, CustomNotificationState> {
  CustomNotificationBloc() : super(CustomNotificationState());

  @override
  Stream<CustomNotificationState> mapEventToState(
      CustomNotificationEvents event) async* {
    // Switch pages on friends page
    if (event is SwitchPage) {
      yield state.newFriendsState(pIndex: event.index);
    }
  }
}
