abstract class LoginEvent {}

class ChangeInput extends LoginEvent {
  final String? username;
  final String? password;
  ChangeInput({this.username, this.password});
}
