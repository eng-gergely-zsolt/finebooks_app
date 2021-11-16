import 'dart:ui';

import 'package:finebooks_app/blocs/registration/registration_bloc.dart';
import 'package:finebooks_app/blocs/registration/registration_state.dart';
import 'package:finebooks_app/screens/registration/components/password_form_registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/data_form_registration.dart';

class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var appWidth = mediaQuery.size.width;
    var appHeight = mediaQuery.size.height;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.red,
                width: appWidth * 1,
                height: appHeight * 1,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      child: Image.asset('assets/images/books-cover3.jpg'),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.25,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.75,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: BlocProvider(
                          create: (context) => RegistrationBloc(),
                          child:
                              BlocBuilder<RegistrationBloc, RegistrationState>(
                                  builder: (context, state) {
                            return state.getRegistrationView() ==
                                    'DataFormRegistration'
                                ? DataFormRegistration(context, state)
                                : PasswordFormRegistration(context, state);
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
