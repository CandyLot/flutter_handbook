import 'package:async_redux_demo/app_state_store_connector.dart';
import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';

import 'app_state_store.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  NavigateAction.setNavigatorKey(navigatorKey);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Redux GraphQL Demo',
        home: AppStateStoreConnector(),
        navigatorKey: navigatorKey,
      ),
    );
  }
}
