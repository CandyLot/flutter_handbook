import 'package:flutter/material.dart';
import 'package:bloc_demo/single_global_instance/blocs/count_bloc.dart';

import 'under_page.dart';

class TopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Page"),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: bLoC.stream,
          initialData: bLoC.value,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Text("You hit me ${snapshot.data} times.");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => UnderPage())),
        },
        child: Icon(Icons.add),
      ),
    );
  }
}