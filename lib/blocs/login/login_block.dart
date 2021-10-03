import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_events.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    //Change input
    if (event is ChangeInput) {
      yield state.newLoginState(
          pUsername: event.username, pPassword: event.password);
    }
  }
}
