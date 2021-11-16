// Data about a user and a friend request sent by this user.

class ReceivedFriendRequest {
  final int senderUserId;
  final int receiverUserId;
  final int friendRequestId;
  final String senderImage;
  final String senderLastName;
  final String senderFirstName;

  ReceivedFriendRequest({
    required this.senderImage,
    required this.senderUserId,
    required this.receiverUserId,
    required this.senderLastName,
    required this.senderFirstName,
    required this.friendRequestId,
  });

  factory ReceivedFriendRequest.fromJson(Map<String, dynamic> json) {
    return ReceivedFriendRequest(
      senderImage: json['sender_image'],
      senderUserId: json['sender_user_id'],
      receiverUserId: json['receiver_user_id'],
      senderLastName: json['sender_last_name'],
      senderFirstName: json['sender_first_name'],
      friendRequestId: json['friend_request_id'],
    );
  }
}
