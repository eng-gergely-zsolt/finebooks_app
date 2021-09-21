import 'package:flutter/material.dart';

import 'screens/login/lobby.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FineBooks',
      home: Scaffold(
        body: Lobby(),
      ),
    );
  }
}
