import 'package:flutter_bloc/flutter_bloc.dart';

import './registration_state.dart';
import './registration_events.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationState());

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    //Set isWaitingForApi
    if (event is SetIsWaitingForApi) {
      yield state.newRegistrationState(pIsWaitingForApi: event.isWaitingForApi);
    }
    //Change view
    else if (event is SetIsModificationRequired) {
      yield state.newRegistrationState(
        pIsModificationRequired: event.isModificationRequired,
      );
    }
    //Change view
    else if (event is ChangeRegistrationView) {
      yield state.newRegistrationState(
          pRegistrationView: event.registrationView,
          pIsModificationRequired: event.isModificationRequired);
    }
    //Change input
    else if (event is ChangeInput) {
      yield state.newRegistrationState(
        pEmail: event.email,
        pUsername: event.username,
        pLastName: event.lastName,
        pPassword: event.password,
        pFirstName: event.firstName,
        pPasswordConfirmation: event.passwordConfirmation,
      );
    }
  }
}
