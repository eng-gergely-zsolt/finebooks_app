import '../models/received_friend_request.dart';
import '../services/other/confirm_friend_request.dart';
import '../services/get/get_friend_requests.dart';

abstract class IFriendRequestsRepository {
  Future<List<ReceivedFriendRequest>> getFriendRequestsRepo(int userId);
  Future<void> confirmFriendRequestRepo(int friendRequestId);
}

class FriendRequestsRepository extends IFriendRequestsRepository {
  @override
  Future<List<ReceivedFriendRequest>> getFriendRequestsRepo(int userId) async {
    return await getFriendRequests(userId);
  }

  Future<void> confirmFriendRequestRepo(int friendRequestId) async {
    await confirmFriendRequest(friendRequestId);
  }
}
