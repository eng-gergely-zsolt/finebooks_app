import 'dart:io';

import 'package:flutter/material.dart';

import './screens/lobby/lobby.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Lobby(),
      ),
    );
    // return MaterialApp(
    //   home: Lobby(),
    // );
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
// var appHeight = mediaQuery.size.width - MediaQueryData.fromWindow(window).padding.top;