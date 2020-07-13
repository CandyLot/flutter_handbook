import 'package:async_redux_demo/user/user_info_item.dart';
import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:graphql/client.dart';

import '../app_state_store.dart';
import '../graphql_client.dart';

class AddAction extends ReduxAction<AppState> {
  final String title;

  AddAction({@required this.title}) : assert(title != null || title != '');

  static const addTodo = r'''
    mutation addTodo($title: String!) {
      addTodo(title: $title) {
        id
        title
        done
      }
    }
  ''';

  @override
  Future<AppState> reduce() async {
    final MutationOptions options = MutationOptions(
      document: addTodo,
      variables: <String, dynamic>{
        'title': title,
      },
    );

    var result = await GraphQLClientAPI.client().mutate(options);

    if (!result.hasErrors) {
      // var todoList = List<Todo>.from(state.todoList)
      //   ..add(Todo(
      //     id: state.todoList.length > 0 ? state.todoList.last.id + 1 : 1,
      //     title: title,
      //     done: false,
      //   ));
      var userInfoItem = UserInfoItem(userID: 10, counter: 1);
      return state.copy(userInfoItem: userInfoItem);
    }

    return state;
  }
}
