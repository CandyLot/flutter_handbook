import 'package:flutter/material.dart';
import 'package:scoped_demo/top_screen.dart';
import 'package:scoped_demo/model/count_model.dart';
import 'package:scoped_model/scoped_model.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // 创建顶层状态
  CountModel countModel = CountModel();
  @override
  Widget build(BuildContext context) {
    return ScopedModel<CountModel> (
      model: countModel,
      child: MaterialApp(
        title: 'Scoped Model Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TopScreen(),
      ),
    );
  }
}
