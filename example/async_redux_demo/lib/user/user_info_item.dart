class UserInfoItem {
  final int userID;
  final int counter;

  UserInfoItem({this.userID, this.counter});

  factory UserInfoItem.initial() => UserInfoItem(userID: 0, counter: 0);

  UserInfoItem copy({int userID, int counter}) => UserInfoItem(
        userID: userID ?? this.userID,
        counter: counter ?? this.counter,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInfoItem &&
          runtimeType == other.runtimeType &&
          userID == other.userID &&
          counter == other.counter;

  @override
  int get hashCode => userID.hashCode ^ counter.hashCode;
}
