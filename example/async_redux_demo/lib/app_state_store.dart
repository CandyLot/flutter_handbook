import 'package:async_redux/async_redux.dart';

import 'user/user_info_item.dart';

var store = Store<AppState>(
  initialState: AppState.initialState(),
);

class AppState {
  final UserInfoItem userInfoItem;

  AppState({this.userInfoItem});

  AppState copy({UserInfoItem userInfoItem}) =>
      AppState(userInfoItem: userInfoItem ?? this.userInfoItem);

  static AppState initialState() => AppState(userInfoItem: UserInfoItem());

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          userInfoItem == other.userInfoItem;

  @override
  int get hashCode => userInfoItem.hashCode;
}
