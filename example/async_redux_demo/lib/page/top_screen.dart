import 'package:async_redux_demo/page/under_screen.dart';
import 'package:async_redux_demo/user/user_info_item.dart';
import 'package:flutter/material.dart';

class TopScreen extends StatelessWidget {
  final UserInfoItem userInfoItem;
  final Function() onQuery;
  final Function(String) onCreate;
  final Function(int, String, bool) onUpdate;
  final Function(int) onRemove;
  final VoidCallback onPop;

  TopScreen({
    Key key,
    this.userInfoItem,
    this.onQuery,
    this.onCreate,
    this.onUpdate,
    this.onRemove,
    this.onPop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top screen'),
      ),
      body: Center(
        child: Text(
          userInfoItem.counter.toString(),
          style: Theme.of(context).textTheme.display1,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return UnderScreen();
          }));
        },
        child: Icon(Icons.forward),
      ),
    );
  }
}
