import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user.dart';
import './registration_bloc.dart';
import './registration_events.dart';
import '../../screens/login/login.dart';
import '../../services/post/post_user.dart';
import '../../functions/simple_error_message.dart';

class RegistrationState {
  bool isWaitingForApi;
  bool isUsernameValid;
  bool isLastNameValid;
  bool isFirstNameValid;
  bool isModificationRequired;
  final String email;
  final String username;
  final String lastName;
  final String password;
  final String firstName;
  final String registrationView;
  final String passwordConfirmation;

  RegistrationState({
    this.isWaitingForApi = false,
    this.isUsernameValid = false,
    this.isLastNameValid = false,
    this.isFirstNameValid = false,
    this.isModificationRequired = false,
    this.email = '',
    this.username = '',
    this.lastName = '',
    this.password = '',
    this.firstName = '',
    this.passwordConfirmation = '',
    this.registrationView = 'DataFormRegistration',
  });

  RegistrationState newRegistrationState({
    bool? pIsWaitingForApi,
    bool? pIsModificationRequired,
    String? pEmail,
    String? pUsername,
    String? pLastName,
    String? pPassword,
    String? pFirstName,
    String? pRegistrationView,
    String? pPasswordConfirmation,
  }) {
    return RegistrationState(
        isWaitingForApi: pIsWaitingForApi ?? this.isWaitingForApi,
        isModificationRequired:
            pIsModificationRequired ?? this.isModificationRequired,
        email: pEmail ?? this.email,
        username: pUsername ?? this.username,
        lastName: pLastName ?? this.lastName,
        password: pPassword ?? this.password,
        firstName: pFirstName ?? this.firstName,
        registrationView: pRegistrationView ?? this.registrationView,
        passwordConfirmation:
            pPasswordConfirmation ?? this.passwordConfirmation);
  }

  void setIsUsernameValid(bool newValue) {
    this.isUsernameValid = newValue;
  }

  void setIsLastNameValid(bool newValue) {
    this.isLastNameValid = newValue;
  }

  void setIsFirstNameValid(bool newValue) {
    this.isFirstNameValid = newValue;
  }

  bool getIsWaitingForApi() {
    return this.isWaitingForApi;
  }

  bool getIsModificationRequired() {
    return this.isModificationRequired;
  }

  String getEmail() {
    return this.email;
  }

  String getUsername() {
    return this.email;
  }

  String getLastName() {
    return this.lastName;
  }

  String getFirstName() {
    return this.firstName;
  }

  String getRegistrationView() {
    return this.registrationView;
  }

  String? validateEmail() {
    String? result;
    bool isEmailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this.email);

    if (this.isUsernameValid) {
      if (this.email.length == 0) {
        result = 'Email is required';
      } else if (this.email.length >= 51) {
        result = 'Email is too long';
      } else if (!isEmailValid) {
        result = 'Email is invalid';
      }
    }
    return result;
  }

  String? validateUsername() {
    String? result;
    setIsUsernameValid(false);

    if (this.isLastNameValid) {
      if (this.username.length == 0) {
        result = 'Username is required';
      } else if (this.username.length <= 2) {
        result = 'Username is too short';
      } else if (this.username.length >= 30) {
        result = 'Username is too long';
      } else {
        setIsUsernameValid(true);
      }
    }
    return result;
  }

  String? validatePassword() {
    String? result;

    if (this.password.length == 0) {
      result = 'Password is required';
    } else if (this.password.length < 3) {
      result = 'Password is too short';
    } else if (this.lastName.length >= 30) {
      result = 'Password is too long';
    }
    return result;
  }

  String? validateLastName() {
    String? result;
    setIsLastNameValid(false);

    if (this.isFirstNameValid) {
      if (this.lastName.length == 0) {
        result = 'Last name is required';
      } else if (this.lastName.length == 1) {
        result = 'Last name is too short';
      } else if (this.lastName.length >= 51) {
        result = 'Last name is too long';
      } else {
        setIsLastNameValid(true);
      }
    }

    return result;
  }

  String? validateFirstName() {
    String? result;
    setIsFirstNameValid(false);

    if (this.firstName.length == 0) {
      result = 'First name is required';
    } else if (this.firstName.length == 1) {
      result = 'First name is too short';
    } else if (this.firstName.length >= 51) {
      result = 'First name is too long';
    } else {
      setIsFirstNameValid(true);
    }
    return result;
  }

  String? validatePasswordConfirmation() {
    String? result;

    if (this.password != this.passwordConfirmation) {
      result = 'The given passwords do not match';
    }
    return result;
  }

  void validateRegistrationn(BuildContext ctx, RegistrationState state,
      GlobalKey<FormState> passwordFormRegistrationKey) {
    bool isValidationSuccessful = false;

    if (passwordFormRegistrationKey.currentState!.validate()) {
      isValidationSuccessful = true;
    }

    if (isValidationSuccessful) {
      ctx
          .read<RegistrationBloc>()
          .add(SetIsWaitingForApi(isWaitingForApi: true));

      String pEmail = "'" + this.email + "'";
      String pUsername = "'" + this.username + "'";
      String pPassword = "'" + this.password + "'";
      String pLastName = "'" + this.lastName + "'";
      String pFirstName = "'" + this.firstName + "'";

      User user = new User(
        id: 1,
        image: '',
        email: pEmail,
        username: pUsername,
        password: pPassword,
        lastName: pLastName,
        firstName: pFirstName,
      );

      Future<String> response = postUser(user);

      response.then((value) {
        ctx.read<RegistrationBloc>().add(SetIsWaitingForApi(
              isWaitingForApi: false,
            ));

        if (value == 'TimeoutException') {
          String message =
              'Somthing is wrong, please check you network connection';
          simpleErrorMessage(ctx, message);
        }
        //Other exception
        else if (value == 'OtherException') {
          String message = 'Other exception';
          simpleErrorMessage(ctx, message);
        }
        //User added successfuly
        else if (value == "\"User added successfully\"") {
          Navigator.push(
            ctx,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
          );
        }
        //Already existing data
        else {
          String emailChecker = '(' + this.email + ')';
          String usernameChecker = '(' + this.username + ')';

          if (value.contains(usernameChecker)) {
            String message = 'This username is already used';
            simpleErrorMessage(ctx, message);
          }
          //Check email
          else if (value.contains(emailChecker)) {
            String message = 'This username is already used';
            simpleErrorMessage(ctx, message);
          }

          ctx.read<RegistrationBloc>().add(SetIsModificationRequired(
                isModificationRequired: true,
              ));
        }
      });
    }
  }
}
