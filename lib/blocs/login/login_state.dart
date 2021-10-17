import '../../models/user.dart';
import '../../services/get/get_user.dart';

class LoginState {
  final String userName;
  final String password;

  bool isUsernameValid;
  bool isPasswordCorrect;

  LoginState({
    this.userName = '',
    this.password = '',
    this.isUsernameValid = false,
    this.isPasswordCorrect = false,
  });

  LoginState newLoginState({
    String? pUsername,
    String? pPassword,
    bool? pIsUsernameValid,
    bool? pIsPasswordCorrect,
  }) {
    return LoginState(
      userName: pUsername ?? this.userName,
      password: pPassword ?? this.password,
      isUsernameValid: pIsUsernameValid ?? this.isUsernameValid,
      isPasswordCorrect: pIsPasswordCorrect ?? this.isPasswordCorrect,
    );
  }

  void setIsUsernameValid(bool newValue) {
    this.isUsernameValid = newValue;
  }

  void setIsPasswordCorrect(bool newValue) {
    this.isPasswordCorrect = newValue;
  }

  String? validateUsername() {
    String? result;

    if (this.isUsernameValid == false) {
      result = 'Invalid username';
    }

    return result;
  }

  String? validatePassword() {
    String? response;

    if (this.isUsernameValid == false) {
    }
    //Invalid password
    else if (this.isPasswordCorrect == false) {
      response = 'Invalid password';
    }

    return response;
  }

  Future<List<User>> validateLogin(String username) {
    setIsUsernameValid(false);
    setIsPasswordCorrect(false);

    Future<List<User>> person = fetchUserByUsername(username);

    person.then((value) {
      if (value.isNotEmpty) {
        setIsUsernameValid(true);

        if (this.password == value[0].password) {
          setIsPasswordCorrect(true);
        }
      }
    });

    return person;
  }
}
