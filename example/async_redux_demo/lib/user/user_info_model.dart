import 'package:async_redux/async_redux.dart';
import 'package:async_redux_demo/actions/add_action.dart';
import 'package:async_redux_demo/actions/query_action.dart';
import 'package:async_redux_demo/actions/remove_action.dart';
import 'package:async_redux_demo/actions/update_action.dart';
import 'package:async_redux_demo/app_state_store.dart';
import 'package:async_redux_demo/user/user_info_item.dart';
import 'package:flutter/material.dart';

class UserInfoModel extends BaseModel<AppState> {
  UserInfoModel();

  UserInfoItem userInfoItem;
  VoidCallback onQuery;
  Function(String) onCreate;
  Function(int, String, bool) onUpdate;
  Function(int) onRemove;
  VoidCallback onPop;

  UserInfoModel.build({
    @required this.userInfoItem,
    @required this.onQuery,
    @required this.onCreate,
    @required this.onUpdate,
    @required this.onRemove,
    @required this.onPop,
  }) : super(equals: [userInfoItem]);

  @override
  BaseModel fromStore() => UserInfoModel.build(
        userInfoItem: state.userInfoItem,
        onQuery: () => dispatch(QueryAction()),
        onCreate: (title) => dispatch(AddAction(title: title)),
        onUpdate: (id, title, done) =>
            dispatch(UpdateAction(id: id, title: title, done: done)),
        onRemove: (id) => dispatch(RemoveAction(id: id)),
        onPop: () => dispatch(NavigateAction.pop()),
      );
}
