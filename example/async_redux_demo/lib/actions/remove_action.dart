import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:graphql/client.dart';

import '../app_state_store.dart';
import '../graphql_client.dart';

class RemoveAction extends ReduxAction<AppState> {
  final int id;

  RemoveAction({@required this.id}) : assert(id > 0);

  static const removeTodo = r'''
    mutation removeTodo($id: Int!) {
      removeTodo(id: $id) {
        id
        title
        done
      }
    }
  ''';

  @override
  Future<AppState> reduce() async {
    final MutationOptions options = MutationOptions(
      document: removeTodo,
      variables: <String, dynamic>{'id': id},
    );
    var result = await GraphQLClientAPI.client().mutate(options);
    if (!result.hasErrors) {
      var userInfoItem = state.userInfoItem;
      return state.copy(userInfoItem: userInfoItem);
    }
    return state;
  }
}
