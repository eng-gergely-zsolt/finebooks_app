class CustomNotificationState {
  int index;

  CustomNotificationState({
    this.index = 0,
  });

  CustomNotificationState newFriendsState({
    int? pIndex,
  }) {
    return CustomNotificationState(
      index: pIndex ?? this.index,
    );
  }

  void setIndex(int pIndex) {
    this.index = pIndex;
  }

  int get getIndex {
    return this.index;
  }
}
