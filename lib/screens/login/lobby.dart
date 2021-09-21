import 'package:flutter/material.dart';

import 'login.dart';
import '../../screens/register/register.dart';

class Lobby extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          ClipPath(
            clipper: LobbyTopCoverClipper(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.69,
              child: Image.asset(
                'assets/images/books-cover3.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.55,
            child: ClipPath(
              clipper: LobbyBottomCoverClipper(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.45,
                color: Color.fromRGBO(174, 148, 116, 0.4),
              ),
            ),
          ),
          Positioned(
            top: 600,
            width: MediaQuery.of(context).size.width * 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.brown,
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.7, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text('Sign in'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.brown,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(254, 251, 236, 1),
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.7, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LobbyTopCoverClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class LobbyBottomCoverClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.31);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
