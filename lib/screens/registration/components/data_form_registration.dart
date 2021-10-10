import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/registration/registration_bloc.dart';
import '../../../blocs/registration/registration_state.dart';
import '../../../blocs/registration/registration_events.dart';

class DataFormRegistration extends StatelessWidget {
  final BuildContext ctx;
  final RegistrationState state;
  static GlobalKey<FormState> dataFormRegistrationKey = GlobalKey<FormState>();

  DataFormRegistration(this.ctx, this.state);

  void _validateRegistration(BuildContext ctx, RegistrationState state) {
    if (dataFormRegistrationKey.currentState!.validate()) {
      ctx.read<RegistrationBloc>().add(
            ChangeRegistrationView(
              isModificationRequired: false,
              registrationView: 'PasswordFormRegistration',
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var appWidth = mediaQuery.size.width;
    var appHeight = mediaQuery.size.height;

    return Padding(
      padding: EdgeInsets.only(left: appWidth * 0.1, right: appWidth * 0.1),
      child: Form(
        key: dataFormRegistrationKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: appHeight * 0.05),
              Text(
                'Registration',
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: appHeight * 0.05),
              TextFormField(
                initialValue: state.getFirstName(),
                validator: (value) => state.validateFirstName(),
                onChanged: (value) => context
                    .read<RegistrationBloc>()
                    .add(ChangeInput(firstName: value)),
                decoration: InputDecoration(
                  labelText: 'First name',
                  prefixIcon: Icon(Icons.person_outline),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
              SizedBox(height: appHeight * 0.04),
              TextFormField(
                initialValue: state.getLastName(),
                validator: (value) => state.validateLastName(),
                onChanged: (value) => context
                    .read<RegistrationBloc>()
                    .add(ChangeInput(lastName: value)),
                decoration: InputDecoration(
                  labelText: 'Last name',
                  prefixIcon: Icon(Icons.person),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
              SizedBox(height: appHeight * 0.04),
              TextFormField(
                initialValue: state.getUsername(),
                validator: (value) => state.validateUsername(),
                onChanged: (value) => context
                    .read<RegistrationBloc>()
                    .add(ChangeInput(username: value)),
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person_pin_circle_outlined),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
              SizedBox(height: appHeight * 0.04),
              TextFormField(
                initialValue: state.getEmail(),
                validator: (value) => state.validateEmail(),
                onChanged: (value) => context
                    .read<RegistrationBloc>()
                    .add(ChangeInput(email: value)),
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
              SizedBox(height: appHeight * 0.04),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  Text('Agree with Terms & Conditions'),
                ],
              ),
              SizedBox(height: appHeight * 0.04),
              ElevatedButton(
                onPressed: () {
                  _validateRegistration(context, state);
                  // postUser();
                },
                child: Text('NEXT'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown,
                  fixedSize: Size(400, 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
