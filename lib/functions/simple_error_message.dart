import 'package:flutter/material.dart';

void simpleErrorMessage(BuildContext? ctx, String message) {
  if (ctx != null) {
    showDialog<String>(
      context: ctx,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'OK',
              style: TextStyle(
                color: Colors.brown,
              ),
            ),
            onPressed: () => Navigator.pop(context, 'OK'),
          ),
        ],
      ),
    );
  }
}
