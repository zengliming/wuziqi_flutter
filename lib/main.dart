import 'package:flutter/material.dart';
import 'package:wuziqi_flutter/page/game_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: GamePage(),
    );
  }
}
