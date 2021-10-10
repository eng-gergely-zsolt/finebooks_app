import 'dart:ui';

import 'package:finebooks_app/services/post/post_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/registration/registration_bloc.dart';
import '../../../blocs/registration/registration_state.dart';
import '../../../blocs/registration/registration_events.dart';

class PasswordFormRegistration extends StatelessWidget {
  final BuildContext ctx;
  final RegistrationState state;
  static GlobalKey<FormState> passwordFormRegistrationKey =
      GlobalKey<FormState>();

  PasswordFormRegistration(this.ctx, this.state);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var appWidth = mediaQuery.size.width;
    var appHeight = mediaQuery.size.height;

    return Padding(
      padding: EdgeInsets.only(left: appWidth * 0.1, right: appWidth * 0.1),
      child: Form(
        key: passwordFormRegistrationKey,
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
            SizedBox(height: appHeight * 0.08),
            TextFormField(
              obscureText: true,
              validator: (value) => state.validatePassword(),
              onChanged: (value) => context
                  .read<RegistrationBloc>()
                  .add(ChangeInput(password: value)),
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.security),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
            SizedBox(height: appHeight * 0.05),
            TextFormField(
              obscureText: true,
              validator: (value) => state.validatePasswordConfirmation(),
              onChanged: (value) => context
                  .read<RegistrationBloc>()
                  .add(ChangeInput(passwordConfirmation: value)),
              decoration: InputDecoration(
                labelText: 'Password confirmation',
                prefixIcon: Icon(Icons.shield),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
            SizedBox(height: appHeight * 0.05),
            !state.getIsModificationRequired()
                ? ElevatedButton(
                    onPressed: () {
                      state.validateRegistrationn(
                          context, state, passwordFormRegistrationKey);
                    },
                    child: Text('REGISTER'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown,
                      fixedSize: Size(400, 20),
                    ),
                  )
                : Opacity(
                    opacity: 0.5,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('REGISTER'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.brown,
                        fixedSize: Size(400, 20),
                      ),
                    ),
                  ),
            SizedBox(height: appHeight * 0.02),
            ElevatedButton(
              onPressed: () {
                ctx.read<RegistrationBloc>().add(
                      ChangeRegistrationView(
                        registrationView: 'DataFormRegistration',
                      ),
                    );
              },
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 20,
                  ),
                  SizedBox(width: appWidth * 0.25),
                  Text('BACK'),
                ],
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.brown,
                fixedSize: Size(400, 20),
              ),
            ),
            SizedBox(height: appHeight * 0.05),
            state.getIsWaitingForApi() == true
                ? CircularProgressIndicator(
                    color: Colors.brown,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
