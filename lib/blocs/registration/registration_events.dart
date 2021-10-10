abstract class RegistrationEvent {}

class SetIsWaitingForApi extends RegistrationEvent {
  final bool? isWaitingForApi;
  SetIsWaitingForApi({this.isWaitingForApi});
}

class SetIsModificationRequired extends RegistrationEvent {
  final bool? isModificationRequired;
  SetIsModificationRequired({this.isModificationRequired});
}

class ChangeRegistrationView extends RegistrationEvent {
  final String? registrationView;
  final bool? isModificationRequired;
  ChangeRegistrationView({this.registrationView, this.isModificationRequired});
}

class ChangeInput extends RegistrationEvent {
  final String? email;
  final String? username;
  final String? lastName;
  final String? password;
  final String? firstName;
  final String? passwordConfirmation;

  ChangeInput(
      {this.email,
      this.username,
      this.lastName,
      this.password,
      this.firstName,
      this.passwordConfirmation});
}
