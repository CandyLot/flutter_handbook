import 'package:async_redux_demo/user/user_info_item.dart';
import 'package:flutter/material.dart';

class UnderScreen extends StatefulWidget {
  final UserInfoItem userInfoItem;
  final Function(String) onCreate;
  final Function(int, String, bool) onUpdate;
  final VoidCallback onPop;

  UnderScreen({
    Key key,
    this.userInfoItem,
    this.onCreate,
    this.onUpdate,
    this.onPop,
  }) : super(key: key);

  @override
  _UnderScreenState createState() => _UnderScreenState();
}

class _UnderScreenState extends State<UnderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Under Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You have pushed the button this many times:'),
              Text(
                // widget.userInfoItem.counter.toString() ?? "",
                "1",
                style: Theme.of(context).textTheme.display1,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          widget.onUpdate(widget.userInfoItem.userID,
              (widget.userInfoItem.counter).toString(), false);
        }));
  }
}
