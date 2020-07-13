import 'package:async_redux/async_redux.dart';
import 'package:async_redux_demo/user/user_info_item.dart';
import 'package:graphql/client.dart';

import '../app_state_store.dart';
import '../graphql_client.dart';

class QueryAction extends ReduxAction<AppState> {
  QueryAction();

  static const userInfoQuery = r'''
    query userInfo($userid: String!) {  
      userInfo (userid: $userid) {
        counter
      }
    }
  ''';

  @override
  Future<AppState> reduce() async {
    final QueryOptions options = QueryOptions(
      document: userInfoQuery,
      variables: <String, dynamic>{
        'userid': '',
      },
    );

    final QueryResult result = await GraphQLClientAPI.client().query(options);

    if (!result.hasErrors) {
      // var todoList = (result.data['userInfo'] as UserInfoItem)
      //     .map((_) => UserInfoItem(userID: _['userid'], counter: _['counter']))
      //     .toList();
      var userInfoItem = UserInfoItem(userID: 10, counter: 0);

      return state.copy(userInfoItem: userInfoItem);
    }

    return state;
  }
}
