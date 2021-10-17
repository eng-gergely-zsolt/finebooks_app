import 'dart:io';

import 'package:flutter/material.dart';

import './models/user.dart';
import '../screens/home/home.dart';
import 'screens/lobby/lobby.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final User user = User(
      id: 1,
      email: 'anomakyr@gmail.com',
      username: 'anomakyr',
      lastName: 'Gergely',
      firstName: 'Zsolt');
  @override
  build(context) {
    // return MaterialApp(
    //   home: Home(user),

    //   // Scaffold(
    //   //   // body: Lobby(),
    //   //   body: Home(user),
    //   // ),
    // );
    return MaterialApp(
      home: Lobby(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// FutureBuilder<Person>(
              //     future: state.validateLogin(),
              //     builder:
              //         (BuildContext context, AsyncSnapshot<Person> snapshot) {
              //       return snapshot.data != null
              //           ? Text(snapshot.data!.firstName)
              //           : Text('fasz');
              //     }),


// var mediaQuery = MediaQuery.of(context);
// var appWidth = mediaQuery.size.width;
// var appHeight = mediaQuery.size.height - MediaQueryData.fromWindow(window).padding.top;