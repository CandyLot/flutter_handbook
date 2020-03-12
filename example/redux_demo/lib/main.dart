import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_demo/states/count_state.dart';
import 'top_screen.dart';

void main() {
  final store = Store<CountState>(reducer, initialState: CountState.initState());
  runApp(new MyAPP(store));
}

class MyAPP extends StatelessWidget {
  final Store<CountState> store;

  MyAPP(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CountState>(
      store: store,
      child: new MaterialApp(
        title: 'Redux demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TopScreen(),
      ),
    );
  }
}
