import 'package:flutter/material.dart';
import 'package:bloc_demo/single_global_instance/top_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "singal_global_instance",
      theme: ThemeData.dark(),
      home: TopPage(),
    );
  }
}
