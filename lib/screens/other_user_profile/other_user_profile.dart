import 'package:flutter/material.dart';

class OtherUserProfile extends StatelessWidget {
  final int index;

  OtherUserProfile(this.index);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.red,
        child: Center(
          child: Text(
            index.toString(),
          ),
        ),
      ),
    );
  }
}
