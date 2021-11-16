import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../models/user.dart';
import '../../models/user_profile.dart';
import '../../services/get/get_relationships_by_id.dart';
import '../../blocs/other_user_profile/other_user_profile_block.dart';
import '../../blocs/other_user_profile/other_user_profile_state.dart';

class OtherUserProfile extends StatelessWidget {
  final User? user;
  final User loggedInUser;

  OtherUserProfile(this.user, this.loggedInUser);

  Future<UserProfile> getUserProfile(int? userId, int? loggedUserId,
      BuildContext context, String imageName) async {
    UserProfile userProfile = UserProfile();
    userProfile.image = NetworkImage('');
    userProfile.relationships = [];

    await Future.wait(
      [
        fetchRelationshipsById(userId).then((value) {
          for (var e in value) {
            if (userId != loggedUserId) {
              if (e.userId1 == userId || e.userId2 == userId) {
                userProfile.areTheyFriends = true;
              }
            }
          }
          userProfile.relationships = value;
        }),
        FireStorageService.loadImage(context, imageName).then((value) {
          userProfile.image = NetworkImage(
            value.toString(),
          );
        }),
      ],
    );

    return userProfile;
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var appWidth = mediaQuery.size.width;
    var appHeight =
        mediaQuery.size.height - MediaQueryData.fromWindow(window).padding.top;

    String username = (user!.username) + '.jpg';

    return FutureBuilder(
      future: getUserProfile(user!.id, loggedInUser.id, context, username),
      builder: (context, AsyncSnapshot<UserProfile> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          print(snapshot.data);
          return Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: appHeight * 0.02),
                snapshot.data != null
                    ? CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        backgroundImage: snapshot.data!.image,
                      )
                    : Container(),
                SizedBox(height: appHeight * 0.02),
                Text(
                  user!.firstName,
                  style: TextStyle(fontSize: appHeight * 0.04),
                ),
                SizedBox(height: appHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '412 books',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: appWidth * 0.02),
                    snapshot.data != null
                        ? Text(
                            snapshot.data!.relationships.length.toString() +
                                ' friends',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        : Text(
                            '0 friends',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: appWidth * 0.05),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                (user!.username) == loggedInUser.username
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.settings),
                          SizedBox(width: appWidth * 0.02),
                          Text('SETTINGS'),
                        ],
                      )
                    : BlocProvider(
                        create: (context) => OtherUserProfileBloc(),
                        child: BlocBuilder<OtherUserProfileBloc,
                            OtherUserProfileState>(
                          builder: (context, state) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                snapshot.data != null &&
                                        snapshot.data!.areTheyFriends == true
                                    ? Row(
                                        children: [
                                          Icon(Icons.group),
                                          SizedBox(width: appWidth * 0.02),
                                          Text('FRIENDS'),
                                        ],
                                      )
                                    : state.getFriendRequestStatus == true
                                        ? Row(
                                            children: [
                                              Icon(Icons.group),
                                              SizedBox(width: appWidth * 0.02),
                                              Text('REQUEST SENT'),
                                            ],
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              state.sendFriendRequest(user!.id,
                                                  loggedInUser.id, context);
                                            },
                                            child: Row(
                                              children: [
                                                Icon(Icons.add),
                                                SizedBox(
                                                    width: appWidth * 0.02),
                                                Text('ADD FRIEND'),
                                              ],
                                            ),
                                          ),
                                SizedBox(width: appWidth * 0.05),
                                Icon(Icons.message),
                                SizedBox(width: appWidth * 0.02),
                                Text('MESSAGE'),
                              ],
                            );
                          },
                        ),
                      ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: appWidth * 0.05),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Text('412 BOOKS'),
              ],
            ),
          );
        }
        // none
        else if (snapshot.connectionState == ConnectionState.none) {
          return Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: CircularProgressIndicator(),
            ),
          );
        }
        // other
        else {
          return Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

class FireStorageService extends ChangeNotifier {
  FireStorageService();

  static Future<String> loadImage(
      BuildContext context, String imageName) async {
    return await FirebaseStorage.instance
        .ref()
        .child(imageName)
        .getDownloadURL();
  }
}
