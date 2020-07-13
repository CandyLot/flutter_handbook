import 'package:async_redux_demo/page/top_screen.dart';
import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:async_redux_demo/app_state_store.dart';
import 'package:async_redux_demo/user/user_info_model.dart';

class AppStateStoreConnector extends StatelessWidget {
  AppStateStoreConnector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserInfoModel>(
      model: UserInfoModel(),
      onInitialBuild: (userInfoModel) => userInfoModel.onQuery(),
      builder: (BuildContext context, UserInfoModel userInfoModel) => TopScreen(
        userInfoItem: userInfoModel.userInfoItem,
        onQuery: userInfoModel.onQuery,
        onCreate: userInfoModel.onCreate,
        onUpdate: userInfoModel.onUpdate,
        onRemove: userInfoModel.onRemove,
        onPop: userInfoModel.onPop,
      ),
    );
  }
}
